require 'rails_helper'

RSpec.describe 'Team model' do

  let(:players_list) { [Player.new(
    nombre: 'Daniel', 
    nivel: 'A', 
    goles: 5, 
    sueldo: 20000, 
    bono: 2500, 
    equipo: 'Azul'),
    Player.new(
    nombre: 'Carlos', 
    nivel: 'B', 
    goles: 9, 
    sueldo: 50000, 
    bono: 8000, 
    equipo: 'Azul'),
    Player.new(
    nombre: 'Alessa', 
    nivel: 'C', 
    goles: 5, 
    sueldo: 60000, 
    bono: 10000, 
    equipo: 'Verde')
    ]
  }

  let(:config) {[
      { nivel: 'A',
        meta: 10    
        },
        {
            nivel: 'B',
            meta: 12    
        },
        {nivel: 'C',
        meta: 15    
    }
  ]}

  let(:valid_team) { Team.new(
    'Azul', 
    players_list,
    config)}

  describe '#Initialize a team' do
    context 'when creating a team' do
      it "is valid with valid attributes" do
        expect(valid_team).to be_valid
      end
      it "is not valid without a name" do
        team = Team.new(nil, players_list, config)
        expect(team).to_not be_valid
      end
      it "is not valid without players" do
        team = Team.new('Azul', nil, config)
        expect(team).to_not be_valid
      end
      it "is not valid without levels_config" do
        team = Team.new('Azul', players_list, nil)
        expect(team).to_not be_valid
      end
      it "keeps only players from the team" do
        expect(valid_team.players.count).to eq(2)
      end
      it "calculates total scores of the team" do
        expect(valid_team.total_scores).to eq(14)  
      end
      it "calculates expected scores of the team" do
        valid_team.calculate_percentage
        expect(valid_team.expected_scores).to eq(22)  
      end
      it "calculates percentage scored" do
        valid_team.calculate_percentage
        expect(valid_team.percentage).to eq((14.to_f/22.to_f))
      end
    end
  end

end