class User < ApplicationRecord

    has_many :jobs
    has_secure_password validations: false
    
    validates_presence_of :name, :surname, :email
    validates_uniqueness_of :email
end
