class AddColumnsToTutorial < ActiveRecord::Migration
  def change
    add_column :tutorials, :category, :string
    add_column :tutorials, :draft, :boolean
  end
end
