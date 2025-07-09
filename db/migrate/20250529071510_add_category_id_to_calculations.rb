class AddCategoryIdToCalculations < ActiveRecord::Migration[7.2]
  def change
    add_column :calculations, :category_id, :integer
  end
end
