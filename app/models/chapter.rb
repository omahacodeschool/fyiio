class Chapter < ActiveRecord::Base
  has_many :steps, dependent: :destroy
  belongs_to(:tutorial)
end
