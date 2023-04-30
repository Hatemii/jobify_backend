class Candidate < ApplicationRecord
  belongs_to :user
  belongs_to :job

  has_one_attached :image
  # ActiveStorage::Blob.count

  validates_uniqueness_of :user_id, scope: :job_id

  before_destroy :remove_image

  def remove_image
    self.image.purge if self.image.attached?
  end

end
