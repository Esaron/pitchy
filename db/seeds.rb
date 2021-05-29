# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(email: 'a@a', password: 'admina', password_confirmation: 'admina')
project = Project.create(name: 'Pitchy', description: 'This app', creator: user)
Like.create(user: user, project: project)
PitchDeck.create(project: project)
