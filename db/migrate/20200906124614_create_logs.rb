class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.references :plan, null: false, foreign_key: true
      t.integer :result, null: false
      t.date :date, null: false
      t.timestamps
    end
  end
end
