class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      # t.references :user, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :target, null: false
      t.string :trigger, null: false
      t.string :habit, null: false
      t.timestamps
    end
  end
end
