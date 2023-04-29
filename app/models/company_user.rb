class CompanyUser < ApplicationRecord
  belongs_to :company
  belongs_to :user

  enum role: { 
    admin: "admin", 
    recruiter: "recruiter", 
    member: "member" 
  }

  validates_uniqueness_of :user_id, scope: :company_id

  before_create :set_role 

  def set_role
    self.role ||= "member"
  end
end
