class Team
    include ActiveModel::Model
    include Utils
    attr_reader :name, :levels_config 
    attr_accessor :players, :percentage, :total_scores, :expected_scores
    validates_presence_of :name, :expected_scores, :total_scores, :levels_config, :players

    # initialization will setup the team to prepare it for the calculations
    def initialize(name, players, config)
        @name = name
        @levels_config = config
        @total_scores = 0
        @expected_scores = 0
        setup_team(players) if !players.nil? 
    end

    # initialize team players from the original list by filtering 
    # and calculate total scores for that players
    def setup_team(players)
        @players = players.select { |player| player.equipo == @name }
        @total_scores = @players.map(&:goles).inject(:+)
    end

    # calculate expected score based on the level of each player
    def setup_expected_score
        @players.each do |player|
            @expected_scores += get_meta_from_config_list(@levels_config, player.nivel)
        end
    end

    # percentage value, for example: 32% will be 0.32
    def calculate_percentage
        setup_expected_score
        @percentage = (@total_scores.to_f / @expected_scores.to_f)
    end

end