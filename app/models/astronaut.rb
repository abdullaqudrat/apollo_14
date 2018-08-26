class Astronaut < ApplicationRecord
  has_many :astronaut_space_missions
  has_many :space_missions, through: :astronaut_space_missions

  validates_presence_of :name, :age, :job

  def self.average_age
    Astronaut.average(:age).to_f.round(2)
  end

  def total_time_in_space
    space_missions.sum(:trip_length)
  end

  def all_ordered_space
    space_missions.all.order(:title)
  end
end
