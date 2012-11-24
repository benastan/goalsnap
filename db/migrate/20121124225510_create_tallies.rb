class CreateTallies < ActiveRecord::Migration
  def change
    create_table :tallies do |t|
      t.string :axis_type
      t.integer :axis_id
      t.integer :user_id
      t.boolean :has_been_spent

      t.timestamps
    end
  end
end
