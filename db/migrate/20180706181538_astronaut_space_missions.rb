class AstronautSpaceMissions < ActiveRecord::Migration[5.1]
  def change
    create_table :astronaut_space_missions do |t|
      t.integer :astronaut_id
      t.integer :space_mission_id
    end
  end
end
