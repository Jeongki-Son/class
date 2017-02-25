class AddBoardToPost < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :board, foreign_key: true
  end
end
