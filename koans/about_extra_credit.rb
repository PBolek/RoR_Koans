# EXTRA CREDIT:
#
# Create a program that will play the Greed Game.
# Rules for the game are in GREED_RULES.TXT.
#
# You already have a DiceSet class and score function you can use.
# Write a player class and a Game class to complete the project.  This
# is a free form assignment, so approach it however you desire.

class Player
    attr_reader :rolls
    attr_reader :points
    attr_reader :tab

    def self.roll(number)
        i = 0
        temp = 0
        @rolls = []
        while i != number
            temp = Random.rand(7)
            next if temp == 0
            @rolls[i] = temp
            i += 1
        end
    end

    def self.add_points(number)
        @points += number
    end

    def self.points_for_roll
        @tab = [0, 0, 0, 0, 0, 0]
        help = @rolls.size
        score = 0
        i = 0
        while i != help
            tab[@rolls[i]] += 1
            i += 1
        end
        if tab[0] == 3
            score += 1000
        elsif tab[0] == 1
            score += 100
        else
            for i in 1..5
                if tab[i] == 3
                    score += i * 100
                elsif tab[i] == 1 && i == 5
                    score += i * 50
                end
            end
        end
    end

    def self.reroll(number)
        count = 0
        for i in 0..5
            if @tab[i] != 3 && (i == 2 || i == 3 || i == 4 || i == 6)
                count += 1
            end
        end
        roll(count)
        points_for_roll
    end

end

class Game
    player1 = Player.new
    player2 = Player.new
end