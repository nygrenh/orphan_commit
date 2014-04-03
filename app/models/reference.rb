class Reference < ActiveRecord::Base
  belongs_to :journal
  belongs_to :reference_type
  belongs_to :publisher

  has_many :reference_authors
  has_many :authors, through: :reference_authors


end
