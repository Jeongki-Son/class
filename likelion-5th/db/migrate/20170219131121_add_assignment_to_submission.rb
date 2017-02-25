class AddAssignmentToSubmission < ActiveRecord::Migration[5.0]
  def change
    add_reference :submissions, :assignment, foreign_key: true
  end
end
