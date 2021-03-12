# frozen_string_literal: true

require 'swagger_helper'

describe 'Goals API' do
  path '/api/v1/goals' do
    get 'Get default goals' do
      tags 'goals'
      produces 'application/json'

      response 200, 'Returns default goals values' do
        it 'has 4 levels' do
          body = JSON(response.body.data)
          expect(body.count).to eq(4)
        end
      end
    end
  end
end
