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

  def new_inproceedings
    @reference = Reference.new
    @reference.reference_type = "Inproceedings"
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

    authors_attributes = reference_params[:authors]
    if not authors_attributes.blank?
      @authors = self.init_or_find_authors(authors_attributes) #metodin runko on helpers/application_helper -tiedostossa
    end

    editors_attributes = reference_params[:editors]
    if not editors_attributes.blank?
      @editors = self.init_or_find_authors(editors_attributes) #authors ja editors samassa taulussa
    end

    if not reference_params[:series].blank?
      @series = Series.find_or_initialize_by_name(reference_params[:series])
    end

    if not reference_params[:organization].blank?
      @organization = Organization.find_or_initialize_by_name(reference_params[:organization])
    end

    @reference = Reference.new(reference_params.except(:journal, :publisher, :authors, :editors, :form_path, :series, :organization))

    @reference.publisher = @publisher
    @reference.journal = @journal
    @reference.series = @series
    @reference.organization = @organization
    @reference.authors_present = !@authors.blank?
    @reference.editors_present = !@editors.blank? 

    respond_to do |format|
      if @reference.save

      if journal_present
        @journal.save
        @reference.update(journal_id: @journal.id)
      end

      if publisher_present
        @publisher.save
        @reference.update(publisher_id: @publisher.id)
      end

      if @reference.authors_present
        self.save_authors(@authors)
        self.create_reference_author_links(@reference, @authors)
      end

      if @reference.editors_present
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
    params[:reference].permit(:title, :year, :reference_type, :volume, :series, :organization, :number, :pages, :month, :note, :address, :key, :booktitle, :form_path, journal: [:name], publisher: [:name], authors: [:names], editors: [:names])
  end

end
