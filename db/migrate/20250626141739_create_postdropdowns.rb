class CreatePostdropdowns < ActiveRecord::Migration[7.2]
  def change
    create_table :postdropdowns do |t|
      t.text :body
      t.string :title
      t.references :dropdown

      t.timestamps
    end
  end
end
