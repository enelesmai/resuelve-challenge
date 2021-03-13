# frozen_string_literal: true

# app/models/player.rb
# class to manage player data and do calculations
class Player
  include ActiveModel::Model
  attr_accessor :nombre, :nivel, :goles, :sueldo, :bono, :sueldo_completo, :equipo, :goles_minimos

  validates :nombre, :nivel, :goles, :sueldo, :bono, :equipo, presence: true

  def initialize(*args)
    args = args[0]
    @nombre = args[:nombre]
    @nivel  = args[:nivel]
    @goles  = args[:goles]
    @sueldo = args[:sueldo]
    @bono   = args[:bono]
    @equipo = args[:equipo]
    @sueldo_completo = args[:sueldo_completo]
    @goles_minimos = 0
  end

  # percentage value, for example: 32% will be 0.32
  def calculate_percentage(meta)
    @goles_minimos = meta
    return 0 if meta.negative?

    (@goles.to_f / meta)
  end

  def calculate_salary(porcentaje_equipo, meta)
    percentage_player = calculate_percentage(meta)
    avg_percentage = (percentage_player.to_f + porcentaje_equipo.to_f) / 2
    @sueldo_completo = ((avg_percentage.to_f * @bono) + @sueldo).truncate(2)
  end
end
