# frozen_string_literal: true

# app/controllers/concerns/validations.rb
# module for adding params validations
module Validations
  def validate_param(params)
    return false if params.nil?

    return false if params.empty?

    return false if params[:jugadores].nil?

    return false if params[:jugadores].empty?

    return false if params[:jugadores].count == 1 && params[:jugadores][0] == ''

    true
  end
end
