class Job < ApplicationRecord
  belongs_to :company
  has_many :candidates, dependent: :destroy
end
