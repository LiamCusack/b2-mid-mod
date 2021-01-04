require 'rails_helper'

RSpec.describe 'Studio index page' do
  before :each do
    @universal = Studio.create(name: "Universal Studios")
    @disney = Studio.create(name: "Walt Disney Studios")

    @jaws = @universal.movies.create(title: "Jaws", creation_year: 1975, genre: "Horror")
    @snow_white = @disney.movies.create(title: "Snow White and the Seven Dwarfs", creation_year: 1937, genre: "Sci-fi/Thriller")

    visit '/studios'
  end

  it "displays names of all studios" do
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@disney.name)
  end

  it "displays the names of all the movies from each studio" do
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@disney.name)
  end
end
