class CreateTutorials < ActiveRecord::Migration
  def change
    create_table :tutorials do |t|
      t.text :title
      t.text :description
      t.string :video
      t.boolean :public
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
