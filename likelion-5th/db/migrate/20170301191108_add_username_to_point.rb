class AddUsernameToPoint < ActiveRecord::Migration[5.0]
  def change
    add_column :points, :username, :string
  end
end
