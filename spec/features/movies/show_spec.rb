require 'rails_helper'

RSpec.describe 'Movie show page' do
  before :each do
    @universal = Studio.create(name: "Universal Studios")

    @jaws = @universal.movies.create(title: "Jaws", creation_year: 1975, genre: "Horror")

    @roy = Actor.create(name: "Roy Schneider", age: 100)
    @rob = Actor.create(name: "Robert Shaw", age: 90)

    MovieActor.create(movie_id: @jaws.id, actor_id: @roy.id)
    MovieActor.create(movie_id: @jaws.id, actor_id: @rob.id)

    visit "/movies/#{@jaws.id}"
  end

  it "displays the attributes of the movie" do
    expect(page).to have_content(@jaws.title)
    expect(page).to have_content(@jaws.creation_year)
    expect(page).to have_content(@jaws.genre)
  end
  it "displays the actors in the movie" do
    expect(page).to have_content(@roy.name)
    expect(page).to have_content(@rob.name)
  end
end
