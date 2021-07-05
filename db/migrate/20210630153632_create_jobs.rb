class CreateJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :level
      t.string :job_type
      t.integer :salary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
