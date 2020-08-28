class Character < ActiveRecord::Base
    belongs_to :user

    def mod(stat)
        ((stat - 10)/2)
    end

    def str_mod(stat)
        mod = self.mod(stat)
        if mod > 0
            mod = "+" + mod.to_s
        end
        mod
    end

    def total_level
        self.barbarian_level + self.bard_level + self.cleric_level + self.druid_level + self.fighter_level + self.monk_level + self.paladin_level + self.ranger_level + self.rogue_level + self.sorcerer_level + self.warlock_level + self.wizard_level
    end

    def prof_mod
        "+" + ((self.total_level + 7)/4).to_s
    end

    def base_ac
        10 + self.mod(self.dex)
    end

    def passive_insight
        10 + self.mod(self.wis)
    end

    def passive_investigation
        10 + self.mod(self.int)
    end

    def passive_perception
        10 + self.mod(self.wis)
    end

    def set_base_speed
        if ("Aarakocra Dwarf Gnome Halfling").include?(self.race)
            self.base_speed = 25
        elsif self.race == "Centaur"
            self.base_speed = 40
        else
            self.base_speed = 30
        end

    end

    def speed
        self.base_speed + (self.mod(self.dex) * 5)
    end

    def self.create(params)
        new_character = self.new(params)
        new_character.set_base_speed
        new_character.save
        new_character
        #This method sets any variables the form doesn't have inputs for.
    end
end