class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.string :location
      t.integer :phone
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
