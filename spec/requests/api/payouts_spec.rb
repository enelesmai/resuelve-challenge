# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Payouts API' do
    # initialize test data

    # Test suite for POST /payouts
    describe 'POST /payouts' do
        # valid payload
        let(:valid_sample) { sample_request }
        # valid payload one player
        let(:valid_attributes) { { jugadores: [ {  
            nombre:"Juan Perez",
            nivel:"C",
            goles:10,
            sueldo:50000,
            bono:25000,
            sueldo_completo:nil,
            equipo:"rojo"
         }] } }
         let(:invalid_attributes) { { jugadores: [ {  
            nombre:"Eloy"
         }] } }
        # expected response sample
        let(:valid_response) { sample_response }
        
        context 'when the request is empty' do
            before { post '/api/v1/payouts' }
      
            it 'returns status code 400' do
              expect(response).to have_http_status(400)
            end
      
            it 'returns a validation failure message' do
              data = JSON.parse(response.body)
              expect(data['message']).to eq('Invalid request, "jugadores" param is required to not be empty')
            end
          end
    
        context 'when the request is invalid' do
          before { post '/api/v1/payouts', params: { title: 'Foobar' } }
    
          it 'returns status code 400' do
            expect(response).to have_http_status(400)
          end
    
          it 'returns a validation failure message' do
            data = JSON.parse(response.body)
            expect(data['message']).to eq('Invalid request, "jugadores" param is required to not be empty')
          end
        end

        context 'when "jugadores" array is empty' do
            before { post '/api/v1/payouts', params: { jugadores: [] } }
      
            it 'returns status code 400' do
              expect(response).to have_http_status(400)
            end
      
            it 'returns a validation failure message' do
              data = JSON.parse(response.body)
              expect(data['message']).to eq('Invalid request, "jugadores" param is required to not be empty')
            end
          end

          context 'when the request has one or more missing attributes' do
            before { post '/api/v1/payouts', params: invalid_attributes }
      
            it 'response with a message error' do
              data = JSON.parse(response.body)
              expect(data['message']).to include('is required')
            end
      
            it 'returns status code 400' do
              expect(response).to have_http_status(400)
            end
          end

          context 'when the request has one player' do
            before { post '/api/v1/payouts', params: valid_attributes }
      
            it 'response with an array of players' do
              data = JSON.parse(response.body)
              expect(data['jugadores']).to be_an_instance_of(Array)
            end
      
            it 'returns status code 200' do
              expect(response).to have_http_status(200)
            end
          end
      
        end
end
