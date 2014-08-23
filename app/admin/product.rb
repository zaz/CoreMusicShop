ActiveAdmin.register Product do
  index do
    selectable_column
    column :id
    column "!", sortable: :'type.code' do |cur|
      cur.type.code if cur.type
    end
    column :brand
    column :name
    column "£", sortable: :price do |cur|
      "%.2f" % cur.price if cur.price
    end
    column "Qty", :quantity
    column :barcode
    actions
  end
end
