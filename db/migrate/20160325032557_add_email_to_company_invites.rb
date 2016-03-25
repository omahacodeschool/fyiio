class AddEmailToCompanyInvites < ActiveRecord::Migration
  def change
    add_column :company_invites, :email, :string
  end
end
