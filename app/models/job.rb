class Job < ApplicationRecord
  belongs_to :company
  has_many :candidates, dependent: :destroy

  enum job_type: {
    part_time: "part_time",
    full_time: "full_time",
    contract: "contract",
    internship: "internship"
  }

  validates_presence_of :title, :job_type
end
