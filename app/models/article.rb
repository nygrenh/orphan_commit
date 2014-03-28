class Article < ActiveRecord::Base
  validates_presence_of :author
  validates_presence_of :title
  validates_presence_of :journal
  validates_presence_of :year
  validates_presence_of :volume
  validates_presence_of :number
  validates_presence_of :abbreviation
  validates_presence_of :pages

  def to_s
    author + ". " + title + ". " + journal + ", " + volume.to_s + "(" + number.to_s + "):" + pages + ", " + year.to_s
  end
end
