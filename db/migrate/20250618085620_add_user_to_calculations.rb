class AddUserToCalculations < ActiveRecord::Migration[7.2]
  def change
    add_reference :calculations, :user, null: false, foreign_key: true
  end
end
