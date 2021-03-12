module Validations
    def validate_param(params)
        
        if params.nil? 
            return false
        end

        if params.empty?
            return false
        end

        if params[:jugadores].nil?
            return false
        end

        if params[:jugadores].empty?
            return false
        end

        if params[:jugadores].count == 1 && params[:jugadores][0]==""
            return false
        end

        true
    end
end