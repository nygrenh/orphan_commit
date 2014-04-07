class Reference < ActiveRecord::Base
  belongs_to :journal

  belongs_to :publisher
  belongs_to :series
  belongs_to :organization

  has_many :reference_authors
  has_many :authors, through: :reference_authors
  has_many :editors, through: :reference_authors

  validate :reference_specific_validtions

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


  def reference_specific_validtions
    if field_should_be_validated?("title")
      unless title.present?
        errors.add :title, "can't be empty"
      end
    end

    if field_should_be_validated?("journal_id")
      if journal_id.nil? and false # journals aren't working atm
        errors.add :journal_id, "can't be empty"
      end
    end

    if field_should_be_validated?("authors")
      if authors_present
        errors.add :authors, "can't be empty"
      end
    end 

    if field_should_be_validated?("year")
      unless year.present?
        errors.add :year, "can't be empty"
      end
    end

    if field_should_be_validated?("publisher")
      unless publisher.present?
        errors.add :publisher, "can't be empty"
      end
    end 

  end

  def field_should_be_validated?(field)
    array = []
    if reference_type == "Article"
      array = ["title", "journal_id", "authors", "year"]
    end
    if reference_type == "Book"
      array = ["author", "title", "publisher", "year"]
    end
    if reference_type == "Inproceeding"
      array = ["author", "title", "year"] # TODO: add booktitle
    end
    array.include?(field)
  end


end
