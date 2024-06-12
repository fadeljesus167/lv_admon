# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create(username: 'admin', password: '1234', role: :admin)
User.create(username: 'accountant', password: '1234', role: :accountant)
User.create(username: 'biller', password: '1234', role: :biller)

SchoolTerm.create(start_date: '01/08/2023', end_date: '20/07/2024')