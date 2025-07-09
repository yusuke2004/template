class AddBodyToVideos < ActiveRecord::Migration[7.2]
  def change
    add_column :videos, :body, :string
  end
end
