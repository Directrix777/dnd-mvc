class Helpers

    def character.current_user(session)
        User.find_by(id: session[:user_id])
    end

    def character.is_logged_in?(session)
        !!session[:user_id]
    end

    def get_pretty_levels(character)
        level_text = []
        levels = {"Barbarian" => character.barbarian_level, "Bard" => character.bard_level, "Cleric" => character.cleric_level, "Druid" => character.druid_level, "Fighter" => character.fighter_level, "Monk" => character.monk_level, "Paladin" => character.paladin_level, "Ranger" => character.ranger_level, "Rogue" => character.rogue_level, "Sorcerer" => character.sorcerer_level, "Warlock" => character.warlock_level, "Wizard" => character.wizard_level}
        levels.each do |closs, level| #closs is used to avoid "class" keyword
            if level > 0
                level_text << "Level #{level}  #{closs}"
            end
        end
        level_text
    end

end