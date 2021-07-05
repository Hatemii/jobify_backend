class RemoveLevelAndCityFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :level, :string
    remove_column :users, :city, :string
  end
end
