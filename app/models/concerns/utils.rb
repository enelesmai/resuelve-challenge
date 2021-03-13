# frozen_string_literal: true

# app/models/concerns/utils.rb
# module to share functions between models
module Utils
  def get_meta_from_config_list(config, nivel)
    config[:configuracion].find { |c| c[:nivel] == nivel }[:meta]
  end
end
