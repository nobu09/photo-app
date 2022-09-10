# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.find_or_create_by!(login: 'user1') do |user|
  user.login = 'user1'
  user.password = 'P@ssw0rd'
end

User.find_or_create_by!(login: 'user2') do |user|
  user.login = 'user2'
  user.password = 'P@ssw0rd'
end
