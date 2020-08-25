require_relative "./version.rb"
class AstanleyCLIProject::Cli
    def start
        puts "Hello West Coast hockey fan! Would you like to see a list of teams from the Pacific Division? (yes/no)"
        if user_input != "no"
            list_teams
        end
    end
    
    
    def list_teams
        AstanleyCLIProject::Team.all.each{|team| puts "#{team.market} #{team.name}"}
    end

    def user_input
        input = gets.chomp
    end
end
