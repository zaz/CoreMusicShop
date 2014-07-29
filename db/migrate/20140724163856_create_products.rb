class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, limit: 50
      t.decimal :price, precision: 10, scale: 2
      t.references :type, index: true

      t.timestamps
    end
  end
end
