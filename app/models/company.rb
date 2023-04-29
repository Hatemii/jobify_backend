class Company < ApplicationRecord
  has_many :company_users, dependent: :destroy
  has_many :jobs, dependent: :destroy

  validates_presence_of :name
  validates_uniqueness_of :name
end
