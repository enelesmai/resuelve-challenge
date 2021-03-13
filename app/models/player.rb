class Player
    include ActiveModel::Model
    attr_accessor :nombre, :nivel, :goles, :sueldo, :bono, :sueldo_completo, :equipo
    validates_presence_of :nombre, :nivel, :goles, :sueldo, :bono, :equipo

    def initialize(*args)
        args = args[0]
        @nombre = args[:nombre]
        @nivel  = args[:nivel]
        @goles  = args[:goles]
        @sueldo = args[:sueldo]
        @bono   = args[:bono]
        @equipo = args[:equipo]
        @sueldo_completo = args[:sueldo_completo]
    end

    # percentage value, for example: 32% will be 0.32
    def calculate_percentage(meta)
        return 0 if meta<0
        (@goles.to_f / meta.to_f)
    end

    def calculate_salary(porcentaje_equipo, meta)
        percentage_player = calculate_percentage(meta)
        avg_percentage = (percentage_player.to_f + porcentaje_equipo.to_f) / 2
        @sueldo_completo = ((avg_percentage.to_f * @bono) + @sueldo).truncate(2)
    end
end