class User < ApplicationRecord
    has_secure_password
    
    validates_presence_of :email
    validates_uniqueness_of :email

    has_many :candidates, dependent: :destroy
    has_many :company_users, dependent: :destroy
end
