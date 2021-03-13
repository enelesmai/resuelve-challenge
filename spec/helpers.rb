# frozen_string_literal: true

module Helpers
  def get_fixture_file(filename)
    content = file_fixture(filename).read
    JSON.parse(content, symbolize_names: false)
  end

  def sample_request_json
    get_fixture_file('sample_request.json')
  end

  def sample_response_json
    get_fixture_file('sample_response.json')
  end

  def custom_valid_request
    PayoutService.new(
      [
        {
          nombre: 'Daniel',
          nivel: 'A',
          goles: 5,
          sueldo: 20_000,
          bono: 2500,
          equipo: 'Azul'
        },
        {
          nombre: 'Carlos',
          nivel: 'B',
          goles: 9,
          sueldo: 50_000,
          bono: 8000,
          equipo: 'Azul'
        },
        {
          nombre: 'Alessa',
          nivel: 'C',
          goles: 5,
          sueldo: 60_000,
          bono: 10_000,
          equipo: 'Verde'
        }
      ], nil
    )
  end

  def custom_valid_response
    [
      Player.new(
        nombre: 'Daniel',
        nivel: 'A',
        goles: 5,
        sueldo: 20_000,
        bono: 2500,
        equipo: 'Azul',
        sueldo_completo: 22_416.66
      ),
      Player.new(nombre: 'Carlos',
                 nivel: 'B',
                 goles: 9,
                 sueldo: 50_000,
                 bono: 8000,
                 equipo: 'Azul',
                 sueldo_completo: 57_333.33),
      Player.new(nombre: 'Alessa',
                 nivel: 'C',
                 goles: 5,
                 sueldo: 60_000,
                 bono: 10_000,
                 equipo: 'Verde',
                 sueldo_completo: 63_333.33)
    ]
  end

  def list_with_valid_attributes
    { jugadores: [{
      nombre: 'Juan Perez',
      nivel: 'C',
      goles: 10,
      sueldo: 50_000,
      bono: 25_000,
      sueldo_completo: nil,
      equipo: 'rojo'
    }] }
  end

  def list_with_invalid_attributes
    { jugadores: [{
      nombre: 'Eloy'
    }] }
  end

  def my_players_list
    [Player.new(
      nombre: 'Daniel',
      nivel: 'A',
      goles: 5,
      sueldo: 20_000,
      bono: 2500,
      equipo: 'Azul'
    ),
     Player.new(
       nombre: 'Carlos',
       nivel: 'B',
       goles: 9,
       sueldo: 50_000,
       bono: 8000,
       equipo: 'Azul'
     ),
     Player.new(
       nombre: 'Alessa',
       nivel: 'C',
       goles: 5,
       sueldo: 60_000,
       bono: 10_000,
       equipo: 'Verde'
     )]
  end

  def my_config
    {
    configuracion: [
      { nivel: 'A',
        meta: 10 },
      {
        nivel: 'B',
        meta: 12
      },
      { nivel: 'C',
        meta: 15 }
    ]
  }
  end

  def my_team
    Team.new(
      'Azul',
      players_list,
      config
    )
  end

  def my_valid_player
    Player.new(
      nombre: 'Juan',
      nivel: 'A',
      goles: 5,
      sueldo: 20_000,
      bono: 2500,
      equipo: 'Azul'
    )
  end
end
