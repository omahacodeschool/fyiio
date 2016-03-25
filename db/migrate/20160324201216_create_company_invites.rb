class CreateCompanyInvites < ActiveRecord::Migration
  def change
    create_table :company_invites do |t|
      t.integer :company_id
      t.string :auth_code
      t.boolean :verified

      t.timestamps null: false
    end
  end
end
