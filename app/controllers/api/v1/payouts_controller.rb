# frozen_string_literal: true
module Api
    module V1
      # Endpoint to calculate payouts given a list of players with/without categories configuration
      class PayoutsController < ApplicationController
          include Defaults, Response, Validations
  
          def calculate

            p "received param #{params[:jugadores]}"

            if !validate_param(params)
                return json_response({message:'Invalid request, "jugadores" param is required to not be empty'},:bad_request)
            end 

              #Validate receiving empty values
              param! :jugadores, Array, required: true do |j|
                  j.param! :nombre, String, required: true
                  j.param! :nivel, String, required: true
                  j.param! :goles, Integer, required: true
                  j.param! :sueldo, Float, required: true
                  j.param! :bono, Float, required: true
                  j.param! :sueldo_completo, Float, required: false
                  j.param! :equipo, String, required: true
              end
  
              param! :configuracion, Array do |c|
                  c.param! :nivel, String, blank: false
                  c.param! :meta, Integer, required: true
              end
  
              #Do cañlculations
              paysheet = PayoutService.new(params[:jugadores])
              json_response({jugadores:paysheet.process})

            rescue RailsParam::Param::InvalidParameterError => e
                json_response({message: e.message}, 400)

          end
  
      end

    end
  end
  