require 'rails_helper'

RSpec.describe 'Payout Service' do
    
  let(:valid_request) { PayoutService.new(
    
      [
        {
    nombre: 'Daniel', 
    nivel: 'A', 
    goles: 5, 
    sueldo: 20000, 
    bono: 2500, 
    equipo: 'Azul'},
    {
    nombre: 'Carlos', 
    nivel: 'B', 
    goles: 9, 
    sueldo: 50000, 
    bono: 8000, 
    equipo: 'Azul'},
    {
    nombre: 'Alessa', 
    nivel: 'C', 
    goles: 5, 
    sueldo: 60000, 
    bono: 10000, 
    equipo: 'Verde'}
    ], nil
  )
}

  describe '#Processing a valid list of players' do
    context 'when creating a new player' do
      it "is valid with valid attributes" do
        expect(valid_request).to be_valid
      end
      it "is not valid without a list_to_process" do
        invalid_request = PayoutService.new(nil,{})
        expect(invalid_request).to_not be_valid
      end
      it "returns a list of players with sueldo_completo" do
        expect(valid_request.process).to be_an_instance_of(Array)
      end
    end
  end

end