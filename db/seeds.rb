# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
MovieActor.destroy_all
Actor.destroy_all
Movie.destroy_all
Studio.destroy_all


@universal = Studio.create(name: "Universal Studios")
@disney = Studio.create(name: "Walt Disney Studios")

@jaws = @universal.movies.create(title: "Jaws", creation_year: 1975, genre: "Horror")
@snow_white = @disney.movies.create(title: "Snow White and the Seven Dwarfs", creation_year: 1937, genre: "Sci-fi/Thriller")

@roy = Actor.create(name: "Roy Schneider", age: 100)
@rob = Actor.create(name: "Robert Shaw", age: 90)

@adriana = Actor.create(name: "Adriana Caselotti", age: 148)
@lucille = Actor.create(name: "Lucille La Verne", age: 146)

MovieActor.create(movie_id: @jaws.id, actor_id: @roy.id)
MovieActor.create(movie_id: @jaws.id, actor_id: @rob.id)
MovieActor.create(movie_id: @snow_white.id, actor_id: @adriana.id)
MovieActor.create(movie_id: @snow_white.id, actor_id: @lucille.id)
