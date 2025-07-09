class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :sex
      t.integer :number
      t.text :body
      t.date :date

      t.timestamps
    end
  end
end
