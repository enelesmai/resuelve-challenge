
# frozen_string_literal: true

require 'swagger_helper'

#test created for swaggerize
describe 'Payouts API' do

  path '/api/v1/payouts' do

    post 'Receive a list of players to calculate paysheet' do
      tags 'Payouts'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :jugadores, in: :body, schema: {
        type: :object,
        properties: {
          jugadores: { 
            type: :array,
            items: { 
              type: :object,
                properties: {
                  nombre: { type: :string },
                  nivel: { type: :string },
                  goles: { type: :integer },
                  sueldo: { type: :number },
                  bono: { type: :number },
                  sueldo_completo: { type: :number },
                  equipo: { type: :string }
                }
            }
          }
        }
      }

      response '200', 'returns paysheet' do
        let(:jugadores) { sample_request_json }
        run_test!
      end

      response '400', 'invalid request' do
        let(:jugadores) { { title: 'foo' } }
        run_test!
      end
    end
  end

end

describe 'Payouts API' do
  # initialize test data

  # Test suite for POST /payouts
  describe 'POST /payouts', type: :request do
    # valid payload
    let(:valid_input_sample) { sample_request_json }
    # valid response
    let(:valid_response_sample) { sample_response_json }
    # valid payload one player
    let(:valid_attributes) { list_with_valid_attributes }
    let(:invalid_attributes) { list_with_invalid_attributes }

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

    context 'when receiving sample request' do
      before { post '/api/v1/payouts', params: valid_input_sample }

      it 'response with an array of players' do
        data = JSON.parse(response.body)
        expect(data['jugadores']).to be_an_instance_of(Array)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a list of players objects with complete salary calculated for El Rulo' do
        result = JSON.parse(response.body)
        p1 = result['jugadores'].find { |p| p['nombre'] == 'El Rulo' }
        r1 = valid_response_sample['jugadores'].find { |p| p['nombre'] == 'El Rulo' }
        expect(p1['sueldo_completo'].to_f).to eq(r1['sueldo_completo'].to_f)
      end
    end
  end
end
