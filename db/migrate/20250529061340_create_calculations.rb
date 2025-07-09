class CreateCalculations < ActiveRecord::Migration[7.2]
  def change
    create_table :calculations do |t|
      t.date :date
      t.integer :amount
      t.string :category
      t.text :note
      t.string :calculation_type

      t.timestamps
    end
  end
end
