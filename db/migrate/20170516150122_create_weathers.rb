class CreateWeathers < ActiveRecord::Migration[5.0]
  def change
    create_table :weathers do |t|
      t.string :city
      t.integer :temp
      t.integer :humidity

      t.timestamps
    end
  end
end
