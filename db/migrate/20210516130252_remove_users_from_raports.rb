class RemoveUsersFromRaports < ActiveRecord::Migration[6.1]
  def change
    remove_column :raports, :users_id, :beginit
  end
end
