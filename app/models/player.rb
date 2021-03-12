class Player
    include ActiveModel::Model
    attr_accessor :nombre, :nivel, :goles, :sueldo, :bono, :sueldo_completo, :equipo
    attribute :nombre, :string
    attribute :nivel, :string
    attribute :goles, :integer
    attribute :sueldo, :float
    attribute :bono, :float
    attribute :sueldo_completo, :float
    attribute :equipo, :string

    def initialize(*args, config)
    end

    # percentage value, for example: 32% will be 0.32
    def calculate_percentage(meta)
        @goles / meta
    end

    def calculate_salary(meta, porcentaje_equipo)
        percentage_player = calculate_percentage(meta)
        avg_percentage = (percentage_player + porcentaje_equipo) / 2
        @sueldo_completo = (avg_percentage * @bono) + @sueldo
    end
end