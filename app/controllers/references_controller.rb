class ReferencesController < ApplicationController
  before_action :set_reference, only: [:show, :edit, :update, :destroy]
  before_action :set_new_reference, only: [:new, :new_article, :new_book, :new_inproceedings]
  before_action :set_tag_s, only: [:new_article, :new_book, :new_inproceedings]
  include ReferencesHelper

  # GET /references
  # GET /references.json
  def index
    if params[:searchtext]
      @references = Reference.search(params[:attribute], params[:searchtext])
      if @references.empty?
        redirect_to references_path, notice: "No references found"
      end
    else
      @references = Reference.all
    end
    @attrs = attributes_for_search
  end


  # GET /references/1
  # GET /references/1.json
  def show
  end

  # GET /references/new
  def new
  end

  def new_article
    @reference.reference_type = "Article"
  end

  def new_book
    @reference.reference_type = "Book"
  end

  def new_inproceedings
    @reference.reference_type = "Inproceedings"
  end

  # GET /references/1/edit
=begin
  def edit
  end
=end

  # POST /references
  # POST /references.json
  def create
    form_path = reference_params[:form_path]

    ref_attributes = create_attribute_object_hash(reference_params)

    @reference = Reference.new(reference_params.except(:journal, :publisher, :authors, :editors, :form_path, :series, :organization))

    connect_attributes_to_reference(@reference, ref_attributes)

    update_tags(params[:reference][:tags])

    respond_to do |format|
      if @reference.save

        create_author_and_editor_links(@reference, ref_attributes)        

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
=begin
  def update
    update_tags(params[:reference][:tags])
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
=end

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

  def set_new_reference
    @reference = Reference.new
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def reference_params
    params[:reference].permit(:title, :year, :reference_type, :volume, :series, :organization, :number, :pages, :month, :note, :address, :key, :booktitle, :edition, :form_path, journal: [:name], publisher: [:name], authors: [:names], editors: [:names])
  end

  def update_tags(tagstring)
    if tagstring.nil?
      return
    end
    tags = tagstring.split(', ')
    tags.each do |t|
      tag = tag(t)
      @reference.tags << tag unless @reference.tags.include? tag
    end
  end

  def tag(name)
    tag = Tag.where("lower(name) = ?", name.downcase).first
    if tag.nil?
      tag = Tag.create name:name
    end
    tag
  end

  def set_tag_s
    @tag_s = @reference.tags.map(&:name).to_sentence(last_word_connector: ", ", two_words_connector: ", ")
  end

  def attributes_for_search
    @attrs = ["author", "editor", "tag", "reference type", "journal", "publisher", "series", "organization"]
    Reference.column_names.each do |name|
      @attrs << name unless name.include? "_" or name.include? "id"
    end
    @attrs
  end

end
