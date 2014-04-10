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
    all_authors = ''
    self.authors.each_with_index do |author, i|
      if i == 0
        all_authors += author.name.to_s
      else
        all_authors += ', ' + author.name.to_s
      end
    end
    return all_authors
  end
  def editors_to_s
    all_editors = ''
    self.editors.each_with_index do |editor, i|
      if i == 0
        all_editors += editor.name.to_s
      else
        all_editors += ', ' + editor.name.to_s
      end
    end
    return all_editors
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
    array = []
    if reference_type == "Article"
      array = ["title", "journal", "authors", "year"]
    end
    if reference_type == "Book"
      array = ["authors", "title", "publisher", "year"]
    end
    if reference_type == "Inproceedings"
      array = ["authors", "title", "year", "booktitle"]
    end
    array.include?(field)
  end


end
