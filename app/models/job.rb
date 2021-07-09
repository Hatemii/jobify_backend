class Job < ApplicationRecord
  belongs_to :user
  has_many :candidates

  has_one_attached :image
  # has_many_attached :image
  
end
