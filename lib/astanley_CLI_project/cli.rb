require_relative "./version.rb"
class AstanleyCLIProject::Cli
    def start
        puts "Hello West Coast hockey fan! Would you like to see a list of teams from the Pacific Division? (yes/no)"
        user_input
        if @input != "no"
            list_teams
            user_input
            team_statistics
        end
    end
    
    
    def list_teams #should list all of the teams in the Pacific Division in order of record. 
        puts "Green = playoff team.".green + " Red = non-playoff team.".red
        AstanleyCLIProject::Team.all.each do |team| 
            puts "--------------------"
            if team.wins > 30
                puts "#{team.rank["division"]}. #{team.market} #{team.name}".green
            else
                puts "#{team.rank["division"]}. #{team.market} #{team.name}".red
            end
            # binding.pry
        end
        puts ""
        puts "To view a team's statistics, please select a team."
    end
    
    def team_statistics #should be able to list all of the statistics of the team that the user inputs in the terminal
        AstanleyCLIProject::Team.all.each do |team|
            otl = team.overtime_losses + team.shootout_losses
            if @input.include?(team.market) || @input.include?(team.market.downcase )|| @input.include?(team.name) || @input.include?(team.name.downcase)
                puts ""
                puts "RECORD:" + " #{team.wins} W".green + " - " + "#{team.losses} L".red + " - " + "#{otl} OTL".red
                puts "POWERPLAY: #{team.powerplay_pct}%"
                puts "PENALTY KILL: #{team.penalty_killing_pct}%"
            end
            # binding.pry
        end
        puts ""
        puts "To view another team's statistics, please select another team. Else, type exit."
    end

    def user_input
        @input = gets.chomp
    end
end
