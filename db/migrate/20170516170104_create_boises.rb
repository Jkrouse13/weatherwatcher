class CreateBoises < ActiveRecord::Migration[5.0]
  def change
    create_table :boises do |t|
      t.float :temp
      t.string :humidity

      t.timestamps
    end
  end
end
