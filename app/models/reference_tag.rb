class ReferenceTag < ActiveRecord::Base
  belongs_to :reference
  belongs_to :tag
end
