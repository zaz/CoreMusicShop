require 'simple_xlsx_reader'

names = ['Accessories', 'Brass', 'Drums and Percussion', 'Equipment', 'Folk', 'Gifts', 'Guitars', 'Harmonicas', 'Keyboards', 'Misc', 'Second Hand', 'Ukuleles', 'Woodwind']
types = ['a', 'iob', 'p', 'e', 'i', 'oi', 'g', 'ih', 'ik', 'o', nil, 'gu', 'iow']

file = File.join('db', 'seeds', 'stock.xlsx')
doc = SimpleXlsxReader.open(file)

types.zip(names).each do |type, name|
  sheet = doc.sheets.drop(1).detect{|s| s.name.strip == name}
  puts "#{sheet.name}:"
  sheet.rows.drop(1).each do |row|
    next if row[4].nil?
    type_id = Type.find_by(code: type).id if type
    puts "  #{row[3]}   #{row[4].truncate(50)}  £#{row[5]}  (!#{type})   Qty: #{row[8]}"
    brand = Brand.find_or_create_by(name: row[3])
    Product.create!(name: row[4].truncate(50), price: row[5],
                    brand_id: brand.id, quantity: row[8],
                    type_id: type_id)
  end
end
