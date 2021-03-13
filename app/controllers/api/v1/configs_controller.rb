# frozen_string_literal: true

module Api
  module V1
    # Shows default values for goals
    class ConfigsController < ApplicationController
      include Defaults
      include Response

      def index
        json_response(DEFAULT_CONFIG)
      end
    end
  end
end
