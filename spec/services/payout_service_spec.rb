require 'rails_helper'
require 'spec_helper'

RSpec.describe 'Payout Service' do
    
  let(:sample_request) { sample_request_json }
  let(:valid_request) { custom_valid_request }
  let(:valid_response) { custom_valid_response }

  describe '#Processing a valid list of players' do
    context 'when creating a new request' do
      it "is valid with valid attributes" do
        expect(valid_request).to be_valid
      end
      it "is not valid without a list_to_process" do
        invalid_request = PayoutService.new(nil,{})
        expect(invalid_request).to_not be_valid
      end
      it "returns a list of players" do
        expect(valid_request.process).to be_an_instance_of(Array)
      end
      it "returns a list of player with expected sueldo_completo" do
        result = valid_request.process
        p1 = result.find{|player| player.nombre == 'Daniel'}
        r1 = valid_response.find{|player| player.nombre == 'Daniel'}
        expect(p1.sueldo_completo).to eq(r1.sueldo_completo)
      end
      it "returns a list of player with expected sueldo_completo" do
        result = valid_request.process
        p1 = result.find{|player| player.nombre == 'Carlos'}
        r1 = valid_response.find{|player| player.nombre == 'Carlos'}
        expect(p1.sueldo_completo).to eq(r1.sueldo_completo)
      end
      it "returns a list of player with expected sueldo_completo" do
        result = valid_request.process
        p1 = result.find{|player| player.nombre == 'Alessa'}
        r1 = valid_response.find{|player| player.nombre == 'Alessa'}
        expect(p1.sueldo_completo).to eq(r1.sueldo_completo)
      end
    end
  end
end