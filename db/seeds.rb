# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Author.create!(id: 100,
  name: "Thai Thuong Bo Y",
  description: "Dep trai khoai to")

Category.create!(id: 100,
  name: "Tieu Thuyet")

Book.create!(id: 1000,
  name: "Trang Buc",
  author_id: 100,
  category_id: 100,
  description: "LOrem x3.14")
