require 'bcrypt'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create(username: "realkhoa", password: BCrypt::Password.create("test"), name: "NGUYEN BA KHOA", email: "a@b", role: "admin")
user2 = User.create(username: "fakeduy", password: BCrypt::Password.create("test2"), name: "DUY", email: "a@b", role: "admin")
