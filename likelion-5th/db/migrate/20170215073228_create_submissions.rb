class CreateSubmissions < ActiveRecord::Migration[5.0]
  def change
    create_table :submissions do |t|
      t.string :c9url
      t.string :giturl
      t.text :content

      t.timestamps
    end
  end
end
