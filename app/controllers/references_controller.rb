class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]
  include ApplicationHelper

  # GET /references
  # GET /references.json
  def index
    @references = Reference.all
  end


  # GET /references/1
  # GET /references/1.json
  def show
  end

  # GET /references/new
  def new
    @reference = Reference.new
  end

  def new_article
    @reference = Reference.new
    @reference.reference_type = "Article"
  end

  def new_book
    @reference = Reference.new
    @reference.reference_type = "Book"
  end

  def new_inproceeding
    @reference = Reference.new
    @reference.reference_type = "Inproceeding"
  end

  # GET /references/1/edit
  def edit
  end

  # POST /references
  # POST /references.json
  def create
    form_path = reference_params[:form_path]

    if not reference_params[:journal].blank?
      journal_attributes = reference_params[:journal]
      if journal_attributes[:name].blank?
        journal_present = false
      else
        @journal = Journal.find_or_initialize_by_name(journal_attributes[:name])
        journal_present = true
      end
    end

    if not reference_params[:publisher].blank?
      publisher_attributes = reference_params[:publisher]
      if publisher_attributes[:name].blank?
        publisher_present = false
      else
        @publisher = Publisher.find_or_initialize_by_name(publisher_attributes[:name])
        publisher_present = true
      end
    end

    if not reference_params[:authors].blank?
      authors_attributes = reference_params[:authors]
      if authors_attributes[:names].blank?
        authors_present = false
      else
        @authors = self.init_or_find_authors(authors_attributes) #metodin runko on helpers/application_helper -tiedostossa
        authors_present = true
      end
    end

    if not reference_params[:editors].blank?
      editors_attributes = reference_params[:editors]
      if editors_attributes[:names].blank?
        editors_present = false
      else
        @editors = self.init_or_find_authors(editors_attributes) #authors ja editors samassa taulussa
        editors_present = true
      end
    end


    @reference = Reference.new(reference_params.except(:journal, :publisher, :authors, :editors, :form_path))

    @reference.publisher_present = publisher_present
    @reference.journal_present = journal_present
    @reference.authors_present = authors_present
    @reference.editors_present = editors_present

    respond_to do |format|
      if @reference.save

        if journal_present
          @journal.save
          @reference.update(journal_id: @journal.id) # validationit vois toimia eritavalla jos naa liittaisi referenceen ennen talletusta
        end

        if publisher_present
          @publisher.save
          @reference.update(publisher_id: @publisher.id)
        end

        if authors_present
          self.save_authors(@authors)
          self.create_reference_author_links(@reference, @authors)
        end

        if editors_present
          self.save_authors(@editors)
          self.create_reference_editor_links(@reference, @editors)
        end

        format.html { redirect_to @reference, notice: 'Reference was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reference }
      else
        format.html { render action: form_path } #pitää saada ohjaamaan virheen jälkeen oikeaan new methodiin, esim new_article, new_book jne
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /references/1
  # PATCH/PUT /references/1.json
  def update
    respond_to do |format|
      if @reference.update(reference_params)
        format.html { redirect_to @reference, notice: 'Reference was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @reference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /references/1
  # DELETE /references/1.json
  def destroy
    @reference.destroy
    respond_to do |format|
      format.html { redirect_to references_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_reference
    @reference = Reference.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reference_params
    params[:reference].permit(:title, :year, :reference_type, :volume, :number, :pages, :month, :note, :address, :key, :booktitle, :form_path, journal: [:name], publisher: [:name], authors: [:names], editors: [:names])
  end

end
