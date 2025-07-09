class CreateDropdowns < ActiveRecord::Migration[7.2]
  def change
    create_table :dropdowns do |t|
      t.string :name

      t.timestamps
    end
  end
end
