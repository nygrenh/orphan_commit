class Organization < ActiveRecord::Base
  has_many :references

  validates :name, presence: true
end
