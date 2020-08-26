require_relative './version.rb'
require 'json'
require 'rest-client'
require 'dotenv/load'
require 'pry'

class AstanleyCLIProject::Team
    attr_accessor :id, :name, :market, :sr_id, :reference, :games_played, :wins, :losses, :overtime_losses, :win_pct, :points, :shootout_wins, :shootout_losses, :goals_for, :goals_against, :goal_diff, :powerplays, :powerplay_goals, :powerplay_pct, :powerplays_against, :powerplay_goals_against, :penalty_killing_pct, :points_pct, :points_per_game, :regulation_wins, :streak, :records, :rank, :calc_rank
    @@all = []

    def initialize(team)
        team.each do |key, value|
            send("#{key}=", value)
        end
        save
        sort_by_wins
        # binding.pry
    end

    def self.new_team_hash(all_teams)
        all_teams.each do |team|
            AstanleyCLIProject::Team.new(team)
        end
    end

    def self.make_team
        AstanleyCLIProject::API.get_team
    end

    def self.all
        if @@all.empty?
            make_team
        end
        @@all
    end

    def sort_by_wins
        @@all.sort! { |team1, team2| team2.wins <=> team1.wins}
    end

    def save
        @@all << self
    end


end
