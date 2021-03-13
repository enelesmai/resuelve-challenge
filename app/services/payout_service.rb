class PayoutService
    include Defaults
    include Utils
    include ActiveModel::Model
    attr_accessor :list_to_process, :players, :teams, :config
    validates_presence_of :list_to_process

    def initialize(list_to_process, config=DEFAULT_CONFIG)
        return if list_to_process.nil?
        @list_to_process = 
            list_to_process.collect { |item| 
                Player.new(
                    nombre: item[:nombre],
                    nivel: item[:nivel],
                    goles: item[:goles].to_i,
                    sueldo: item[:sueldo].to_f,
                    bono: item[:bono].to_f,
                    equipo: item[:equipo]
                )
            }
        @config = config
        @config = DEFAULT_CONFIG if config.nil? 
        @teams = []
        @players_to_return = []
    end

    #for each player on the received list it is going to calculate the complete salary
    def process
        @list_to_process.each do |player| 
            
            #if player team is not already on the list, it will be calculated and added
            current_team = @teams.find{ |team| team.name == player.equipo }
            if current_team.nil?
                current_team = Team.new(player.equipo, @list_to_process, @config)
                current_team.calculate_percentage
                @teams << current_team
            end

            #do calculations
            meta = get_meta_from_config_list(@config, player.nivel)
            player.calculate_salary(current_team.percentage, meta)
            @players_to_return << player
            
        end
        @players_to_return.map {
            |player| PlayerResponse.new(
                nombre: player.nombre,
                goles_minimos: player.goles_minimos,
                goles: player.goles, 
                sueldo: player.sueldo,
                bono: player.bono,
                sueldo_completo: player.sueldo_completo,
                equipo: player.equipo
            )
        }
    end
end