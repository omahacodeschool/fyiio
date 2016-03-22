class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.text :title
      t.text :description
      t.integer :tutorial_id
      t.boolean :draft
      t.integer :start_time
      t.integer :end_time

      t.timestamps null: false
    end
  end
end
