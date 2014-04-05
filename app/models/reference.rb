class Reference < ActiveRecord::Base
  belongs_to :journal
  belongs_to :reference_type
  belongs_to :publisher

  has_many :reference_authors
  has_many :authors, through: :reference_authors

  if :reference_type == 1 # just a test
    validates :title,         presence: true
    validates :journal_id,    presence: true
    validates :authors,       presence: true
    validates :year,          presence: true
  end


  validates :year,          numericality: {less_than_or_equal_to: ->(_) { Time.now.year },
                                           greater_than_or_equal_to: 0}

  validates :volume,        allow_blank: true,
                            numericality: {only_integer: true,
                                           greater_than_or_equal_to: 1}

  validates :number,        allow_blank: true,
                            numericality: {only_integer: true,
                                           greater_than_or_equal_to: 1}


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



end
