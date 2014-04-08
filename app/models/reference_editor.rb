class ReferenceEditor < ActiveRecord::Base
  belongs_to :reference
  belongs_to :author
end
