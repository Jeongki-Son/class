class AddUserToPoint < ActiveRecord::Migration[5.0]
  def change
    add_reference :points, :user, foreign_key: true
  end
end
