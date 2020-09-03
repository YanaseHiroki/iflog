class CreatePlans < ActiveRecord::Migration[6.0]
  def change
    create_table :plans do |t|
      # t.references :user, null: false, foreign_key: true
      t.string :habit, null: false
      t.string :trigger, null: false
      t.integer :target, null: false
      t.timestamps
    end
  end
end

# belongs_to :user
# has_many :logs