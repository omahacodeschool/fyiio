class AddUserRefToProgress < ActiveRecord::Migration
  def change
    add_reference :progresses, :user, index: true, foreign_key: true
    add_reference :progresses, :step, index: true, foreign_key: true

  end
end
