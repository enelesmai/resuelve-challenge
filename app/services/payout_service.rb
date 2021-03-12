class PayoutService
    include Defaults
    attr_accesor :list_to_process, :players, :teams, :config

    def initialize(list_to_process, config=DEFAULT_CONFIG)
        @list = list
        @config = config
        @teams = []
        @players_to_return = []
    end

    #for each player on the received list it is going to calculate the complete salary
    def procces
        @list.each |item| do 
            
            #cast item on the list as player
            player = Player.new(...item)

            #if player team is not already on the list, it will be calculated and added
            current_team = @teams.find{ |team| team.name == player.equipo }
            if exist_team.nil?
                current_team = Team.new(player.equipo, list, config)
                @teams << current_team
            end

            #do calculations
            own_goal = @config.find{|c| c.nivel == player.nivel}.meta
            player.calculate_salary(current_team.percentage, own_goal)
            @players_to_return << player
            
        end
        @players_to_return
    end
end