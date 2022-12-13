# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Game.destroy_all
Booking.destroy_all

u1 = User.create!(name: "Michel", email: "michel@michel.com", password: "azerty")
u2 = User.create!(name: "Julie", email: "julie@julie.com", password: "azerty")
u3 = User.create!(name: "Lulu", email: "lulu@lulu.com", password: "azerty")

g1 = Game.create!(title: "Pokemon", description: "jeux de cartes à collectionner et à jouer", price_per_day: "10", street_number: "12", street: "rue du mail", zip_code: "69004", city: "Lyon", user: u1)
g2 = Game.create!(title: "Piou-Piou", description: "jeu de cartes pour tout âge", price_per_day: "5", street_number: "20", street: "rue des capucins", zip_code: "69001", city: "Lyon", user: u1)
g3 = Game.create!(title: "Agricola", description: "construisez votre ferme", price_per_day: "20", street_number: "100", street: "chemin du creuzet", zip_code: "69730", city: "Genay", user: u2)
g4 = Game.create!(title: "Aventuriers du Rails", description: "jeu de voyage en trains et bateaux des fois", price_per_day: "25", street_number: "20", street: "avenue Leon Tolstoi", zip_code: "69150", city: "Décines-Charpieu", user: u3)
g5 = Game.create!(title: "Chasse au Gigamons", description: "mémory", price_per_day: "12", street_number: "4", street: "place Commandant Arnaud", zip_code: "69004", city: "Lyon", user: u3)
