class AddUserToRaports < ActiveRecord::Migration[6.1]
  def change
    add_reference :raports, :user, null: true 
  end
end
