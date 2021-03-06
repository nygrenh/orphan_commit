class Reference < ActiveRecord::Base
  include Bibtex

  belongs_to :journal
  belongs_to :publisher
  belongs_to :series
  belongs_to :organization

  has_many :reference_authors, dependent: :destroy
  has_many :reference_editors, dependent: :destroy
  has_many :authors, through: :reference_authors
  has_many :editors, through: :reference_editors, source: :author
  has_many :reference_tags, dependent: :destroy
  has_many :tags, through: :reference_tags

  validate :reference_specific_validations

  validates :year,          numericality: {less_than_or_equal_to: ->(_) { Time.now.year },
                                           greater_than_or_equal_to: 0}

  validates :volume,        allow_blank: true,
                            numericality: {only_integer: true,
                                           greater_than_or_equal_to: 1}

  validates :number,        allow_blank: true,
                            numericality: {only_integer: true,
                                           greater_than_or_equal_to: 1}

  
  attr_accessor :authors_present
  attr_accessor :editors_present


  def authors_to_s
    authors.to_sentence(last_word_connector: ", ", two_words_connector: ", ")
  end

  def editors_to_s
    editors.to_sentence(last_word_connector: ", ", two_words_connector: ", ")
  end

  def reference_specific_validations
    validate_field(:title, title)
    validate_field(:journal, journal)
    validate_field(:authors, authors, authors_present)
    validate_field(:editors, editors, editors_present)
    validate_field(:year, year)
    validate_field(:booktitle, booktitle)
    validate_field(:publisher, publisher)
  end

  def validate_field(attribute, value, present=false)
    if field_should_be_validated?(attribute.to_s)
      if not value.present? and not present
        errors.add attribute, "can't be empty"
      end
    end
  end

  def field_should_be_validated?(field)
    required = case reference_type
    when "Article" then ["title", "journal", "authors", "year"].to_set
    when "Book" then ["authors", "title", "publisher", "year"].to_set
    when "Inproceedings" then ["authors", "title", "year", "booktitle"].to_set
    else Set.new
    end
    required.include?(field)
  end

  def self.search(attribute, searchtext)
    case attribute
      when "reference type"
        non_exact_search("reference_type", searchtext)
      when "editor"
        search_from_editor(searchtext)
      when "title", "booktitle", "edition", "address", "key", "note", "pages"
        non_exact_search(attribute, searchtext)
      when "number", "volume", "year", "month"
        exact_search(attribute, searchtext)
      when "journal", "publisher", "series", "organization", "author", "tag"
        search_from(attribute, searchtext)
    end
  end

  def self.non_exact_search(attribute, searchtext)
    @references = Reference.where(attribute + ' LIKE ?', "%#{searchtext}%")
  end

  def self.exact_search(attribute, searchtext)
    @references = Reference.where(attribute => searchtext)
  end

  def self.search_from_editor(searchtext)
    entries = Author.where('name LIKE ?', "%#{searchtext}%")
    @references = Array.new
    entries.each do |entry|
      entry.edited_references.each do |r|
        @references << r
      end
    end
    @references
  end

  def self.search_from(table, searchtext)
    entries = eval(table.capitalize).where('name LIKE ?', "%#{searchtext}%")
    @references = Array.new
    entries.each do |entry|
      entry.references.each do |r|
        @references << r
      end
    end
    @references
  end

end
