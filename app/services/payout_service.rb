class PayoutService
    include Defaults
    attr_accesor :list_to_process, :players, :teams, :config

    def initialize(list_to_process, config=DEFAULT_CONFIG)
        @list = list
        @config = config
        @players = []
        @temas = []
    end
end