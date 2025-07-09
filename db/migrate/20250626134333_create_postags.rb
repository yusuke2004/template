class CreatePostags < ActiveRecord::Migration[7.2]
  def change
    create_table :postags do |t|
      t.string :title
      t.string :body

      t.timestamps
    end
  end
end
