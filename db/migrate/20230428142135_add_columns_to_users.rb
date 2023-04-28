class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone, :string
    add_column :users, :role, :string

    remove_column :users, :admin, :string
    remove_column :users, :recruiter, :string
  end
end
