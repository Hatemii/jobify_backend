class Job < ApplicationRecord
  belongs_to :user
  has_many :candidates

  has_one_attached :image
  # validates :image, attached: true, content_type: :png


end
