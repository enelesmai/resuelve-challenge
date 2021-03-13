# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Team model' do
  let(:players_list) { my_players_list }

  let(:config) { my_config }

  let(:valid_team) { my_team }

  describe '#Initialize a team' do
    context 'when creating a team' do
      it 'is valid with valid attributes' do
        expect(valid_team).to be_valid
      end
      it 'is not valid without a name' do
        team = Team.new(nil, players_list, config)
        expect(team).to_not be_valid
      end
      it 'is not valid without players' do
        team = Team.new('Azul', nil, config)
        expect(team).to_not be_valid
      end
      it 'is not valid without levels_config' do
        team = Team.new('Azul', players_list, nil)
        expect(team).to_not be_valid
      end
      it 'keeps only players from the team' do
        expect(valid_team.players.count).to eq(2)
      end
      it 'calculates total scores of the team' do
        expect(valid_team.total_scores).to eq(14)
      end
      it 'calculates expected scores of the team' do
        valid_team.calculate_percentage
        expect(valid_team.expected_scores).to eq(22)
      end
      it 'calculates percentage scored' do
        valid_team.calculate_percentage
        expect(valid_team.percentage).to eq((14.to_f / 22))
      end
    end
  end
end
