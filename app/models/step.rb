class Step < ActiveRecord::Base
  belongs_to(:chapter)
  validates :description, :length => { :maximum => 250 }
end
