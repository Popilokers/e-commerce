# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Page.find_or_create_by!(slug: "about") do |p|
#   p.title = "About"
# end

# Page.find_or_create_by!(slug: "contact") do |p|
#   p.title = "Contact"
# end

# require 'csv'

# # read .csv files

# # https://www.datablist.com/learn/csv/download-sample-csv-files#products-dataset
# product_csv = Rails.root.join('db/products.csv')

# # inserts data into Products table

# CSV.foreach(product_csv, headers: true) do |product|
#   puts "Seeding Product: #{product.to_h}"
#     category = Category.find_or_create_by(name: product["Category"])
#     Product.create!(
#       name: product["Name"],
#       price: product["Price"].to_f,
#       description: product["Description"],
#       stock_quantity: rand(0..100),
#       category: category
#     )
# end

# puts "Seeding Products Complete. Total Products: #{Product.count}"

require 'csv'

# read .csv files

# https://www.datablist.com/learn/csv/download-sample-csv-files#products-dataset
books_csv = Rails.root.join('db/books.csv')


CSV.foreach(books_csv, headers: true) do |product|
  puts "Seeding Product: #{product.to_h}"
  in_stock = product["Availability"].downcase.strip == "in stock"
    Product.create!(
      name: product["Title"],
      price: product["Price"].to_f,
      in_stock: in_stock,
      stock_quantity: rand(1..100),
      category_id: 2 
    )
end

puts "Seeding Products Complete. Total Products: #{Product.count}"

