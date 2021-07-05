class User < ApplicationRecord
    has_secure_password validations: false
    
    has_many :raports
    
    validates_presence_of :name, :surname, :email
    validates_uniqueness_of :email
end
