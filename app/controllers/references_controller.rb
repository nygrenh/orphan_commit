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
    journal_attributes = reference_params[:journal]
    publisher_attributes = reference_params[:publisher]
    authors_attributes = reference_params[:authors]

    @journal = Journal.find_or_initialize_by_name(journal_attributes[:name])
    @publisher = Publisher.find_or_initialize_by_name(publisher_attributes[:name])
    @authors = self.init_or_find_authors(authors_attributes) #metodin runko on helpers/application_helper -tiedostossa


    @reference = Reference.new(reference_params.except(:journal, :publisher, :authors))
    @reference.reference_type = params[:type]

    @reference.authors_present = @authors.empty?

    respond_to do |format|
      if @reference.save

        @journal.save
        @publisher.save
        self.save_authors(@authors)

        self.create_reference_author_links(@reference, @authors)

        @reference.update(journal_id: @journal.id)
        @reference.update(publisher_id: @publisher.id)

        format.html { redirect_to @reference, notice: 'Reference was successfully created.' }
        format.json { render action: 'show', status: :created, location: @reference }
      else
        format.html { render action: 'new' } #pitää saada ohjaamaan virheen jälkeen oikeaan new methodiin, esim new_article, new_book jne
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
      params[:reference].permit(:title, :year, :type, :volume, :number, :pages, :month, :note, :address, :key, journal: [:name], publisher: [:name], authors: [:names])
    end

end
