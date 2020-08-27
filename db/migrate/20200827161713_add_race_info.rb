class AddRaceInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :characters, :race, :string
    add_column :characters, :base_speed, :integer
  end
end
