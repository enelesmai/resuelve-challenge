class Team
    include ActiveModel::Model
    attr_reader :name, :expected_scores, :total_scores, :levels_config 
    attr_accessor :players, :percentage
    attribute :name, :string
    attribute :expected_scores, :integer
    attribute :total_scores, :integer
    attribute :percentage, :float

    # initialization will setup the team and will calculate percentage
    def initialize(name, players, config)
        @levels_config = config
        @total_scores = 0
        @expected_scores = 0
        setup_team(name, players)
        calculate_percentage
    end

    # initialize team players from the original list by filtering 
    # and calculate total scores for that players
    def setup_team(players, team)
        @players = players.select { |player| player.equipo == team }
        @total_scores = players.inject { |sum, n| sum + player.goles }
    end

    # calculate expected score based on the level of each player
    def setup_expected_score
        @players.each |player| do
            @expected_scores += @config_levels.find{ |c| c.nivel == player.nivel }.meta
        end
    end

    # percentage value, for example: 32% will be 0.32
    def calculate_percentage
        @percentage = @total_scores / @expected_scores
    end

end