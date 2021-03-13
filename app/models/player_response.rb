# frozen_string_literal: true

# app/models/player_response.rb
# class to manage response to return data to the user
class PlayerResponse
  include ActiveModel::Model
  attr_accessor :nombre, :goles, :sueldo, :bono, :sueldo_completo, :equipo, :goles_minimos

  def initialize(*args)
    args = args[0]
    @nombre = args[:nombre]
    @goles_minimos = args[:goles_minimos]
    @goles  = args[:goles]
    @sueldo = args[:sueldo]
    @bono   = args[:bono]
    @sueldo_completo = args[:sueldo_completo]
    @equipo = args[:equipo]
  end
end
