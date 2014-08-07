require 'csv'

names = %w{Accessories Brass Drums_and_Percussion Equipment Folk_ Gifts Guitars Harmonicas Keyboards Misc Second_Hand Ukuleles Woodwind}
types = [1, 5, 4, 6, 3, nil, 2, 20, 21, nil, nil, 2, 22]

types.zip(names).each do |type, name|
  file = File.join('..', 'stock', "#{name}.csv.ascii")
  puts file
  CSV.open(file).drop(1).each do |row|
    next if row[4].nil?
    puts "  #{row[3]}   #{row[4].truncate(50)}  £#{row[5]}  (#{type}: #{Type.find(type).name if type})   Qty: #{row[8]}"
    # Product.create!(name: row[4].truncate(50), price: row[5], type_id: type)
    brand = Brand.find_or_create_by(name: row[3])
    Product.create!(name: row[4].truncate(50), price: row[5],
                    brand_id: brand.id, quantity: row[8], type_id: type)
  end
end
