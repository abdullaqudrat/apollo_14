class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
    @average_astronaut_age = Astronaut.average_age
  end
end
