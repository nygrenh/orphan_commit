class Journal < ActiveRecord::Base
  has_many :references

  validates :name, presence: :true
end
