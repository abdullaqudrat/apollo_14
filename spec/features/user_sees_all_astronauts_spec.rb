require 'rails_helper'

describe 'astronaut index' do
  it 'can see all astronauts' do
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 38, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age: 32, job: 'Pilot')

    visit '/astronauts'

    expect(page).to have_content("Name: #{astronaut_1.name}")
    expect(page).to have_content("Age: #{astronaut_2.age}")
    expect(page).to have_content("Job: #{astronaut_1.job}")
  end

  it 'can see average age of astronauts' do
    astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 33, job: 'Commander')
    astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age: 32, job: 'Pilot')
    @average_astronaut_age = Astronaut.average_age

    visit '/astronauts'

    expect(page).to have_content("Average Age: #{@average_astronaut_age}")
  end

  it 'can see space missions for each astronaut' do
    @astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 33, job: 'Commander')
    @astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age: 32, job: 'Pilot')
    @space_mission_1 = @astronaut_1.space_missions.create(title: "Apollo 13", trip_length: 300)
    @space_mission_2 = @astronaut_1.space_missions.create(title: "Capricorn", trip_length: 250)
    @space_mission_3 = @astronaut_2.space_missions.create(title: "Gemini 7", trip_length: 550)

    visit '/astronauts'

    expect(page).to have_content("Apollo 13")
    expect(page).to have_content("Capricorn")
    expect(page).to have_content("Gemini 7")
  end

  it 'can see time in space for each astronaut' do
      @astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 33, job: 'Commander')
      @astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age: 32, job: 'Pilot')
      @space_mission_1 = @astronaut_1.space_missions.create(title: "Capricorn", trip_length: 300)
      @space_mission_2 = @astronaut_1.space_missions.create(title: "Zen Voyage", trip_length: 350)
      @space_mission_4 = @astronaut_1.space_missions.create(title: "Xavier Project", trip_length: 800)
      @space_mission_6 = @astronaut_2.space_missions.create(title: "Xavier Project", trip_length: 800)
      @space_mission_5 = @astronaut_1.space_missions.create(title: "Apollo 13", trip_length: 220)
      @space_mission_3 = @astronaut_2.space_missions.create(title: "Gemini 7", trip_length: 550)

    visit '/astronauts'
    
    expect(page).to have_content("Total Time in Space: #{@astronaut_1.total_time_in_space} days")
    expect(page).to have_content("Total Time in Space: #{@astronaut_2.total_time_in_space} days")
  end


end
