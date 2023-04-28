class Company < ApplicationRecord
  has_many :company_users, dependent: :destroy
  has_many :jobs, dependent: :destroy
end