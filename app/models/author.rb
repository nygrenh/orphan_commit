class Author < ActiveRecord::Base
  has_many :reference_authors
  has_many :reference_editors
  has_many :references, through: :reference_authors
  has_many :references, through: :reference_editors

end
