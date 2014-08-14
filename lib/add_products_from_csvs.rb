require 'csv'

names = %w{Accessories Brass Drums_and_Percussion Equipment Folk_ Gifts Guitars Harmonicas Keyboards Misc Second_Hand Ukuleles Woodwind}
types = ['a', 'iob', 'p', 'e', 'i', 'oi', 'g', 'ih', 'ik', 'o', nil, 'gu', 'iow']

types.zip(names).each do |type, name|
  file = File.join('..', 'stock', "#{name}.csv.ascii")
  puts file
  CSV.open(file).drop(1).each do |row|
    next if row[4].nil?
    type_id = Type.find_by(code: type).id if type
    puts "  #{row[3]}   #{row[4].truncate(50)}  £#{row[5]}  (!#{type})   Qty: #{row[8]}"
    brand = Brand.find_or_create_by(name: row[3])
    Product.create!(name: row[4].truncate(50), price: row[5],
                    brand_id: brand.id, quantity: row[8],
                    type_id: type_id)
  end
end
