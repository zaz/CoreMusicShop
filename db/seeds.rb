# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

types_file = File.open Rails.root.join('db', 'seeds', 'types')
for line in types_file
  code, name = line.strip.split(': ')
  Type.create!(code: code, name: name) if code and name
end

require 'add_products_from_csvs'
