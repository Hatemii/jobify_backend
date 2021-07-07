class User < ApplicationRecord

    has_many :jobs, dependent: :destroy
    has_secure_password validations: false
    
    validates_presence_of :name, :surname, :email
    validates_uniqueness_of :email
end
