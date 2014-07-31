class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :brand, index: true
    add_column :products, :quantity, :int
    add_column :products, :barcode, :int
  end
end
