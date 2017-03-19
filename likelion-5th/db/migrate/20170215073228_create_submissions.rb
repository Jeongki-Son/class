class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :herokuurl
      t.string :giturl
      t.text :content
      t.string :imagefile

      t.timestamps
    end
  end
end
