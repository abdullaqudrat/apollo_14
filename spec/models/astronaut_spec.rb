require 'rails_helper'

describe Astronaut, type: :model do
  before(:each) do
    @astronaut_1 = Astronaut.create(name: 'Neil Armstrong', age: 33, job: 'Commander')
    @astronaut_2 = Astronaut.create(name: 'Buzz Aldrin', age: 32, job: 'Pilot')
    @space_mission_1 = @astronaut_1.space_missions.create(title: "Capricorn", trip_length: 300)
    @space_mission_2 = @astronaut_1.space_missions.create(title: "Zen Voyage", trip_length: 350)
    @space_mission_4 = @astronaut_1.space_missions.create(title: "Xavier Project", trip_length: 800)
    @space_mission_5 = @astronaut_1.space_missions.create(title: "Apollo 13", trip_length: 220)
    @space_mission_3 = @astronaut_2.space_missions.create(title: "Gemini 7", trip_length: 550)
  end
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end
  describe 'Class Methods' do
    describe 'average_age method' do
      it 'should calculate average age of all astronauts' do

        expect(Astronaut.average_age).to eq(32.5)
      end
    end
  end
  describe 'Instance Methods' do
    describe 'total_time_in_space' do
      it 'should calculate total time in space for astronaut' do

        expect(@astronaut_1.total_time_in_space).to eq(1670)
        expect(@astronaut_2.total_time_in_space).to eq(550)
      end
    end

    describe 'ordered_space_trips' do
      it 'should find and order all space trips for astronaut' do

        expect(@astronaut_1.all_ordered_space).to eq([@space_mission_5, @space_mission_1, @space_mission_4, @space_mission_2,])
        expect(@astronaut_2.all_ordered_space).to eq([@space_mission_3])
      end
    end
  end


end
