require_relative "./version.rb"
class AstanleyCLIProject::Cli
    def start
        greeting
        user_input
        if @input != "no"
            list_teams
        end
        choose_team
        team_statistics
        until @input == "exit"
            team_statistics
        end
    end

    def greeting
        puts ""
        puts "Hello West Coast hockey fan! Would you like to see a list of teams from the Western Conference? (yes/no)"
    end

    def choices
        puts "To view a team's statistics, please select a team."
    end

    def list_teams #should list all of the teams in the Pacific Division in order of record. 
        puts ""
        puts "Green = playoff team.".green + " Red = non-playoff team.".red
        sleep(2.5)
        AstanleyCLIProject::Team.all.each do |team| 
            puts "--------------------"
            if team.rank["clinched"]
                puts "#{team.rank["conference"]}. #{team.market} #{team.name}".green
            else
                puts "#{team.rank["conference"]}. #{team.market} #{team.name}".red
            end
            # binding.pry
        end
        puts "----------------------"
        puts ""
    end

    def choose_team
        puts "To view a team's statistics, please select a team."
        puts ""
        user_input
    end
    
    def team_statistics #should be able to list all of the statistics of the team that the user inputs in the terminal
        AstanleyCLIProject::Team.all.each do |team|
            otl = team.overtime_losses + team.shootout_losses
            if @input.include?(team.market) || @input.include?(team.market.downcase)|| @input.include?(team.name) || @input.include?(team.name.downcase)
                puts ""
                puts "#{team.market} #{team.name}"
                puts "===================="
                puts "DIVISION RANK: #{team.rank["division"]}"
                puts "GAMES PLAYED: #{team.games_played}"
                puts "RECORD:" + " #{team.wins} W".green + " - " + "#{team.losses} L".red + " - " + "#{otl} OTL".red
                puts "WIN PCT: #{team.win_pct}"
                puts "POWERPLAY: #{team.powerplay_pct}%"
                puts "PENALTY KILL: #{team.penalty_killing_pct}%"
            end
            # binding.pry
        end
        puts ""
        puts "To view another team's statistics, please select another team. Else, type exit."
        user_input
    end

    def user_input
        @input = gets.chomp
    end
end
