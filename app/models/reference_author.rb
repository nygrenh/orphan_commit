class ReferenceAuthor < ActiveRecord::Base
  belongs_to :reference
  belongs_to :author
end
