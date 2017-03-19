class AddSubmissionToLike < ActiveRecord::Migration[5.0]
  def change
    add_reference :likes, :submission, foreign_key: true
  end
end
