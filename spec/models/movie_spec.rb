require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    it {should validate_presence_of :title}
    it {should validate_presence_of :creation_year}
    it {should validate_presence_of :genre}
  end

  describe 'relationships' do
    it {should have_many :movie_actors}
    it {should belong_to :studio}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'methods' do
    describe 'average_age_of_actors' do
      it "finds the average age of all its actors" do

        @jaws = Movie.create(title: "Jaws", creation_year: 1975, genre: "Horror")

        @roy = Actor.create(name: "Roy Schneider", age: 100)
        @rob = Actor.create(name: "Robert Shaw", age: 90)

        MovieActor.create(movie_id: @jaws.id, actor_id: @roy.id)
        MovieActor.create(movie_id: @jaws.id, actor_id: @rob.id)

        expect(@jaws.average_age_of_actors).to eq(95.0)
      end
    end
  end
end
