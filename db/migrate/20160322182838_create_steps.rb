class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.text :title
      t.text :description
      t.integer :chapter_id
      t.boolean :draft
      t.boolean :warning
      t.integer :start_time
      t.integer :end_time

      t.timestamps null: false
    end
  end
end
