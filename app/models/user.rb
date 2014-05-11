class User < ActiveRecord::Base
    has_many :home_games,
             :class_name => "Game",
             :foreign_key => "home_id",
             :dependent => :destroy
    has_many :away_games,
             :class_name => "Game",
             :foreign_key => "away_id",
             :dependent => :destroy
    validates_presence_of :name
    validates_uniqueness_of :name

    def to_s
        name
    end

    def username
        name
    end

    def games
        self.home_games + self.away_games
    end

    def wins
        User.get_wins(self, self.games)
    end

    def losses
        User.get_losses(self, self.games)
    end
    
    def ties
        User.get_ties(self.games)
    end

    def teams
	  User.get_teams(self)
    end

    def winning_home_games
        self.home_games.delete_if{ |game| game.home_score < game.away_score }
    end

    def winning_away_games
        self.away_games.delete_if{ |game| game.away_score < game.home_score }
    end

    def winning_games
	  self.winning_home_games + self.winning_away_games
    end

    def winningest_home_team
        User.most_common_team(self, self.winning_home_games)
    end

    def winningest_away_team
        User.most_common_team(self, self.winning_away_games)
    end

    def winningest_team
        User.most_common_team(self, self.winning_games)
    end

    def favourite_team
        User.most_common_team(self, self.games)
    end

    def biggest_home_victory
        return nil unless winning_home_games
        winning_home_games.max do |a,b|
            (a.home_score - a.away_score) <=> (b.home_score - b.away_score)
        end
    end

    def biggest_away_victory
        return nil unless winning_away_games
        winning_away_games.max do |a,b|
            (a.away_score - a.home_score) <=> (b.away_score - b.home_score)
        end
    end

    def biggest_victory
        if biggest_home_victory
            home_margin = biggest_home_victory.home_score - biggest_home_victory.away_score
        end
        if biggest_away_victory
            away_margin = biggest_away_victory.away_score - biggest_away_victory.home_score
        end
        unless home_margin && away_margin
            if home_margin
                return biggest_home_victory
            else
                return biggest_away_victory
            end
        end
        if home_margin > away_margin
            biggest_home_victory
        elsif away_margin > home_margin
            biggest_away_victory
        else
            if biggest_away_victory.away_score > biggest_home_victory.home_score
                biggest_away_victory
            else
                biggest_home_victory
            end
        end
    end

    def wins_against(user)
        User.get_wins(self, User.get_matchups(self, user))
    end

    def losses_against(user)
        User.get_losses(self, User.get_matchups(self, user))
    end

    def ties_against(user)
        User.get_ties(User.get_matchups(self, user))
    end

    def home_win_percentage
        win_percentage(home_games)
    end

    def away_win_percentage
        win_percentage(away_games)
    end

    def win_percentage(games=nil)
        games = self.games if games.nil?
        wins = User.get_wins(self, games)
        (wins.to_f / games.size.to_f) * 100.0
    end

    def User.get_matchups(user1, user2)
        home = Game.find(:all, 
                         :conditions => ["home_id = ? and away_id = ?",
                                         user1,
                                         user2] )
        away = Game.find(:all,
                         :conditions => ["home_id = ? and away_id = ?",
                                         user2,
                                         user1] )
        (home + away).sort { |a,b| a.played_on <=> b.played_on }
    end

    def User.get_wins(user, games)
        wins = 0
        for game in games
            if game.home_id == user.id
                wins += 1 if game.home_score > game.away_score
            else
                wins += 1 if game.away_score > game.home_score
            end
        end
        wins
    end
 
    def User.get_losses(user, games)
        losses = 0
        for game in games
            if game.home_id == user.id
                losses += 1 if game.home_score < game.away_score
            else
                losses += 1 if game.away_score < game.home_score
            end
        end
        losses
    end

    def User.get_ties(games)
        ties = 0
        for game in games
            ties += 1 if game.home_score == game.away_score
        end
        ties
    end

    def User.most_common_team(user, games)
	  return "None" unless user && games
        favs = games.inject({}) do |teams, game|
            name = if game.home_id == user.id 
                       game.home_team
                   else
                       game.away_team
                   end
            teams[name] ||= 0
            teams[name] += 1
            teams
        end
        favourite = favs.max{ |a,b| a[1] <=> b[1] }
        if favourite
            favourite[0]
        else
            "None"
        end
    end

end
