class Candidate < ApplicationRecord
  belongs_to :job, dependent: :destroy
  validates_presence_of :name, :surname, :email, :location, :phone

  has_one_attached :image
end
