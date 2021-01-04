class Movie <ApplicationRecord
  belongs_to :studio
  has_many :movie_actors
  has_many :actors, through: :movie_actors
  validates_presence_of :title, :creation_year, :genre

  def average_age_of_actors
    self.actors.average(:age)
  end

  def order_actors_by_age
    self.actors.order(age: :desc)
  end
end
