class Game < ActiveRecord::Base
    belongs_to :away_user,
               :class_name => "User",
               :foreign_key => "away_id"
    belongs_to :home_user,
               :class_name => "User",
               :foreign_key => "home_id"
    TEAMS = [ 'Anaheim', 'Atlanta', 'Boston', 'Buffalo', 'Calgary',
              'Carolina', 'Chicago', 'Colorado', 'Columbus', 'Dallas',
              'Detroit', 'Edmonton', 'Florida', 'Los Angeles', 'Minnesota',
              'Montreal', 'Nashville', 'New Jersey', 'NY Islanders',
              'NY Rangers', 'Ottawa', 'Philadelphia', 'Phoenix',
              'Pittsburgh', 'San Jose', 'St Louis', 'Tampa Bay', 'Toronto',
              'Vancouver', 'Washington' ]
    validates_presence_of :home_user, :away_user,
                          :home_team, :away_team,
                          :home_score, :away_score
    validates_inclusion_of :home_team, :away_team,
                           :in => TEAMS,
                           :message => 'must be a valid NHL team'
    validates_numericality_of :home_score, :away_score

    def validate
        if home_id == away_id
            errors.add_to_base("Home and Away users must be different")
        end
    end

end
