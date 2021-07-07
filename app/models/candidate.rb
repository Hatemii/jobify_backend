class Candidate < ApplicationRecord
  belongs_to :job, dependent: :destroy
end
