# frozen_string_literal: true

require 'swagger_helper'

describe 'Config API' do
  path '/api/v1/configs' do
    get 'Get an example of configuration object' do
      tags 'configs'
      produces 'application/json'

      response 200, 'Returns default config values' do
        it 'has 4 levels' do
          body = JSON(response.body.data)
          expect(body.count).to eq(4)
        end
      end
    end
  end
end
