module Utils
    def get_meta_from_config_list(config, nivel)
        config.find{|c| c.nivel == nivel}.meta
    end
end