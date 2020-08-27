class Character < ActiveRecord::Base
    belongs_to :user

    def mod(stat)
        (stat - 10)/2
    end
end