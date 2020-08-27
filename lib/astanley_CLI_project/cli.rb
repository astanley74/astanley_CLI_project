require_relative "./version.rb"
class AstanleyCLIProject::Cli
    def start
        greeting
        user_input
        if @input == "yes" && @input != "no"
            list_teams
        else
            goodbye
            exit
        end
        choose_team
        team_stats
    end

    def greeting
        puts ""
        puts "Hello hockey fan! Would you like to see a list of teams from the NHL? (yes/no)".yellow
    end

    def list_teams #should list all of the teams in the Pacific Division in order of record. 
        puts ""
        puts "Green = playoff team.".green + " Red = non-playoff team.".red
        sleep(2)
        AstanleyCLIProject::Team.all.each_with_index do |team, i| 
            puts "--------------------"
            if team.rank["clinched"]
                puts "#{i+1}. #{team.market} #{team.name}".green
            else
                puts "#{i+1}. #{team.market} #{team.name}".red
            end
            # binding.pry
        end
        puts "----------------------"
        puts ""
    end

    def choose_team
        puts ""
        puts "To view a team's statistics, please select a team."
        puts ""
        user_input
    end
    
    def team_stats #should be able to list all of the statistics of the team that the user inputs in the terminal
        AstanleyCLIProject::Team.all.each do |team|
            otl = team.overtime_losses + team.shootout_losses
            if @input.include?(team.market) || @input.include?(team.market.downcase)|| @input.include?(team.name) || @input.include?(team.name.downcase)
                puts ""
                puts "        #{team.market} #{team.name}        ".green
                # puts "#{team.wins} #{team.losses}"
                # binding.pry
                puts "---------------------------------"
                puts "To view team record, type record."
                puts "To view offensive statistics, type offense."
                puts "To view defensive statistics, type defense."
                puts "To view special teams statistics, type special teams."
                puts "To select another team, type next."
                puts "To exit, type exit."
                puts ""
                puts "Please select a statistic to view, or choose another team"
                user_input
                until @input == "END"
                if @input == "record"
                    puts ""
                    puts "     RECORD    ".green
                    puts "==============="
                    puts "GAMES PLAYED:" + " #{team.games_played}".green
                    puts "RECORD:" + " #{team.wins} W".green + " - " + "#{team.losses} L".red + " - " + "#{otl} OTL".red
                    puts "WIN PCT:" + " #{team.win_pct}".green
                    puts ""
                    puts "Please choose another statistic or type next to view another team."
                    user_input
                elsif @input == "offense"
                    puts ""
                    puts "    OFFENSE    ".blue
                    puts "==============="
                    puts "GOALS FOR:" + " #{team.goals_for}".blue
                    puts "POINTS:" + " #{team.points}".blue
                    puts "POINTS %:" + " #{team.points_pct}".blue
                    puts "PPG:" + " #{team.points_per_game}".blue
                    puts ""
                    puts "Please choose another statistic or team to view."
                    user_input
                elsif @input == "defense"
                    puts ""
                    puts "    DEFENSE    ".red
                    puts "==============="
                    puts "GOALS AGAINST:" + " #{team.goals_against}".red
                    puts "GOAL DIFF:" + " #{team.goal_diff}".red
                    puts ""
                    puts "Please choose another statistic or team to view."
                    user_input
                elsif @input == "special teams"
                    puts ""
                    puts " SPECIAL TEAMS   ".yellow
                    puts "==============="
                    puts "PP %:" + " #{team.powerplay_pct}".yellow
                    puts "POWERPLAYS:" + " #{team.powerplays}".yellow
                    puts "PK %:" + " #{team.penalty_killing_pct}".yellow
                    puts "PENALTY KILLS:" + " #{team.powerplays_against}".yellow
                    puts ""
                    puts "Please choose another statistic or team to view."
                    user_input
                elsif @input == "next"
                    choose_team
                    team_stats
                elsif @input == "exit"
                    goodbye
                    exit
                end
            end
            elsif @input == "exit"
                exit
            end
            # binding.pry
            # binding.pry
        end
    end

    def goodbye
        puts ""
        puts "Thank you, hockey fan!".yellow
        puts ""
    end

    def user_input
        @input = gets.chomp
    end
end
