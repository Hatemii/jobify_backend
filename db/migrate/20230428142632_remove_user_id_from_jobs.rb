class RemoveUserIdFromJobs < ActiveRecord::Migration[6.1]
  def change
    remove_column :jobs, :user_id
  end
end
