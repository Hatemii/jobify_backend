class AddNewColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :confirmation_token, :string
    add_column :users, :expire_token_at, :string
  end
end
