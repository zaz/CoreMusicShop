ActiveAdmin.register Product, as: "No Barcode" do
  menu label: "No Barcode (#{Product.where(barcode: nil).count})", parent: 'Warnings'

  controller do
    def scoped_collection
      super
      Product.where(barcode: nil)
    end
  end
end

ActiveAdmin.register Product, as: "No Price" do
  menu label: "No Price (#{Product.where(price: nil).count})", parent: 'Warnings'

  controller do
    def scoped_collection
      Product.where(price: nil)
    end
  end
end

ActiveAdmin.register Product, as: "No Quantity" do
  menu label: "No Quantity (#{Product.where(quantity: nil).count})", parent: 'Warnings'

  controller do
    def scoped_collection
      Product.where(quantity: nil)
    end
  end
end

ActiveAdmin.register Product, as: "Negative Quantity" do
  menu label: "Negative Quantity (#{Product.where('quantity < ?', 1).count})", parent: 'Warnings'

  controller do
    def scoped_collection
      Product.where('quantity < ?', 1)
    end
  end
end
