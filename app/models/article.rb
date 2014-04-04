class Article < ActiveRecord::Base
  validates :author,        presence: true

  validates :title,         presence: true

  validates :journal,       presence: true

  validates :year,          presence: true,
                            numericality: {less_than_or_equal_to: ->(_) { Time.now.year },
                                           greater_than_or_equal_to: 0}

  validates :volume,        allow_blank: true,
                            numericality: {only_integer: true,
                                           greater_than_or_equal_to: 1}

  validates :number,        allow_blank: true,
                            numericality: {only_integer: true,
                                           greater_than_or_equal_to: 1}


  def to_s
    author + ". " + title + ". " + journal + ", " + volume.to_s + "(" + number.to_s + "):" + pages + ", " + year.to_s
  end
end
