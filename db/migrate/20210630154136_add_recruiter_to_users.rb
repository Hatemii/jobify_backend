class AddRecruiterToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :recruiter, :boolean, default: false
  end
end
