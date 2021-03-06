class AstanleyCLIProject::Cli
    def start
        greeting
        if @input == "yes"
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
        puts "Hello hockey fan! Would you like to see a list of teams from the NHL? (yes/no)".cyan
        puts ""
        user_input
    end

    def list_teams #should list all of the teams in the NHL in order of record. 
        puts ""
        puts "Green = playoff team.".green.underline + " Red = non-playoff team.".red.underline
        sleep(1.5)
        AstanleyCLIProject::Team.all.each_with_index do |team, i| 
            puts "--------------------"
            if team.rank["division"] <= 4
                puts "#{i+1}. #{team.market} #{team.name}".green
            else
                puts "#{i+1}. #{team.market} #{team.name}".red
            end
            # binding.pry
        end
        puts "----------------------"
    end

    def choose_team
        puts ""
        puts "To view a team's statistics, please select a team.".underline
        puts ""
        user_input
        if @input == "exit"
            goodbye
            exit
        end
    end
    
    def team_stats #should display the team name that the user has chosen and give them a list of options they can use to display data about the team. 
        AstanleyCLIProject::Team.all.each do |team|
            otl = team.overtime_losses + team.shootout_losses
            if @input.include?(team.market.downcase) || @input.include?(team.name.downcase)
                puts ""
                puts "        #{team.market} #{team.name}        ".cyan
                puts "---------------------------------"
                puts "To view team record, type record.".yellow
                puts "To view offensive statistics, type offense.".yellow
                puts "To view defensive statistics, type defense.".yellow
                puts "To view special teams statistics, type special teams.".yellow
                puts "To select another team, type next.".yellow
                puts "To exit, type exit.".yellow
                puts ""
                puts "Please select a statistic to view, or choose another team".underline
                puts ""
                user_input
                until @input == "END"
                    case @input
                    when "record"
                        puts ""
                        puts "     RECORD    ".green
                        puts "==============="
                        puts "GAMES PLAYED:" + " #{team.games_played}".green
                        puts "RECORD:" + " #{team.wins} W".green + " - " + "#{team.losses} L".red + " - " + "#{otl} OTL".red
                        puts "WIN PCT:" + " #{team.win_pct}".green
                        puts ""
                        puts "Please choose another statistic or type next to view another team.".underline
                        puts ""
                        user_input
                    when "offense", "o"
                        puts ""
                        puts "    OFFENSE    ".blue
                        puts "==============="
                        puts "GOALS FOR:" + " #{team.goals_for}".blue
                        puts "POINTS:" + " #{team.points}".blue
                        puts "POINTS %:" + " #{team.points_pct}".blue
                        puts "PPG:" + " #{team.points_per_game}".blue
                        puts ""
                        puts "Please choose another statistic or type next to view another team.".underline
                        puts ""
                        user_input
                    when "defense"
                        puts ""
                        puts "    DEFENSE    ".red
                        puts "==============="
                        puts "GOALS AGAINST:" + " #{team.goals_against}".red
                        puts "GOAL DIFF:" + " #{team.goal_diff}".red
                        puts ""
                        puts "Please choose another statistic or type next to view another team.".underline
                        puts ""
                        user_input
                    when "special teams"
                        puts ""
                        puts " SPECIAL TEAMS   ".yellow
                        puts "==============="
                        puts "PP %:" + " #{team.powerplay_pct}".yellow
                        puts "POWERPLAYS:" + " #{team.powerplays}".yellow
                        puts "PK %:" + " #{team.penalty_killing_pct}".yellow
                        puts "PENALTY KILLS:" + " #{team.powerplays_against}".yellow
                        puts ""
                        puts "Please choose another statistic or type next to view another team.".underline
                        puts ""
                        user_input
                    when "next"
                        choose_team
                        team_stats
                    when "exit"
                        goodbye
                        exit
                    end
                end
            elsif @input == "exit"
                goodbye
                exit
            end
            # binding.pry
        end
    end

    def goodbye
        puts ""
        puts "Thank you, hockey fan!".cyan
        puts ""
    end

    def user_input
        @input = gets.chomp.downcase
    end
end
