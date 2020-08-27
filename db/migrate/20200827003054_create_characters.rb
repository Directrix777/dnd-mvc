class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.integer :barbarian_level
      t.integer :bard_level
      t.integer :cleric_level
      t.integer :druid_level
      t.integer :fighter_level
      t.integer :monk_level
      t.integer :paladin_level
      t.integer :ranger_level
      t.integer :rogue_level
      t.integer :sorcerer_level
      t.integer :warlock_level
      t.integer :wizard_level
      t.integer :str
      t.integer :dex
      t.integer :con
      t.integer :int
      t.integer :wis
      t.integer :cha
    end
  end
end
