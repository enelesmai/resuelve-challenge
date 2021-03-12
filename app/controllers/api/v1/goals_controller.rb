module Api
  module V1
    # Shows default values for goals
    class GoalsController < ApplicationController
      include Defaults
      include Response

      def index
        json_response({
                        data: DEFAULT_CONFIG
                      })
      end
    end
  end
end
