# frozen_string_literal: true

module Defaults
  DEFAULT_CONFIG =
    [
      {
        nivel: 'A',
        meta: 5
      },
      {
        nivel: 'B',
        meta: 10
      },
      {
        nivel: 'C',
        meta: 15
      },
      {
        nivel: 'Cuauh',
        meta: 20
      }
    ].freeze

  SAMPLE_RESPONSE = { jugadores: [
    {
      nombre: 'El Rulo',
      goles_minimos: 10,
      goles: 9,
      sueldo: 30_000,
      bono: 15_000,
      sueldo_completo: 14_250,
      equipo: 'rojo'
    }
  ] }.freeze
end
