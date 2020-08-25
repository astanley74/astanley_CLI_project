require_relative "./version.rb"
class AstanleyCLIProject::Cli
    def start
        puts "Hello West Coast hockey fan! Would you like to see a list of teams from the Pacific Division? (yes/no)"
        if user_input != "no"
            list_teams
            # team_record
        end
    end
    
    
    def list_teams #should list all of the teams in the Pacific Division in order of record. 
        AstanleyCLIProject::Team.all.each do |team| 
            puts "--------------------"
            puts "#{team.market} #{team.name}"
            # binding.pry
        end
    end
    
    def team_record
        AstanleyCLIProject::Team.all.each do |team|
            otl = team.overtime_losses + team.shootout_losses
            puts "#{team.wins} W #{team.losses} L #{otl} OTL"
        end
    end

    def user_input
        input = gets.chomp
    end
end
