class CreateCompanyUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :company_users do |t|
      t.references :company, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
