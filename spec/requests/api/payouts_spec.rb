# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Payouts API' do
    # initialize test data

    # Test suite for POST /payouts
    describe 'POST /payouts' do
        # valid payload
        let(:valid_attributes) { sample_request }
        let(:valid_attributes) { sample_response }
    
        context 'when the request is valid' do
          before { post '/payouts', params: sample_request }
    
          it 'response with an array of players' do
            data = JSON.parse(response.body)
            expect(data['jugadores']).to be_an_instance_of(Array)
          end
    
          it 'returns status code 200' do
            expect(response).to have_http_status(200)
          end
        end
    
        context 'when the request is invalid' do
          before { post '/payouts', params: { title: 'Foobar' } }
    
          it 'returns status code 400' do
            expect(response).to have_http_status(400)
          end
    
          it 'returns a validation failure message' do
            expect(response.body)
              .to match(/Validation failed: An array of "jugadores" is expected/)
          end
        end
      end
end
