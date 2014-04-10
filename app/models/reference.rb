class Reference < ActiveRecord::Base
  include Bibtex

  belongs_to :journal

  belongs_to :publisher
  belongs_to :series
  belongs_to :organization

  has_many :reference_authors
  has_many :reference_editors
  has_many :authors, through: :reference_authors
  has_many :editors, through: :reference_editors, source: :author

  validate :reference_specific_validations

  # if reference_type("Article")

  # end


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
end
