class Tag < ActiveRecord::Base
  has_many :reference_tags, dependent: :destroy
  has_many :references, through: :reference_tags

  validates :name, presence: :true
end
