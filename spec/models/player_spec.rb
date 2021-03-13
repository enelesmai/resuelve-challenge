require 'rails_helper'

RSpec.describe 'Player model' do
    
  let(:valid_player) { my_valid_player }

  describe '#Creates a new player' do
    context 'when creating a new player' do
      it "is valid with valid attributes" do
        expect(valid_player).to be_valid
      end
      it "is not valid without a nombre" do
        player = Player.new(nombre: nil)
        expect(player).to_not be_valid
      end
      it "is not valid without a sueldo" do
        player = Player.new(sueldo: nil)
        expect(player).to_not be_valid
      end
      it "is not valid without goles" do
        player = Player.new(goles: nil)
        expect(player).to_not be_valid
      end
    end
  end

  describe '#Calculate percentage reached' do
    context 'when creating a player, and setting up the goal based on the level' do 
        it "it returns .5 with a meta value of 10" do
            expect(valid_player.calculate_percentage(10)).to eq(0.5)
        end
        it "it returns .625 with a meta value of 8" do
            expect(valid_player.calculate_percentage(8)).to eq(0.625)
        end
        it "it returns 0 with a meta value of -1" do
            expect(valid_player.calculate_percentage(-1)).to eq(0)
        end
    end
  end

  describe '#Calculate salary' do
    context 'when creating a player, and setting up the goal based on the level' do 
        it "it returns 21781.25 with a meta value of 8 and team_percentage of .625" do
            expect(valid_player.calculate_salary(0.8, 8)).to eq(21781.25)
        end
    end
  end

end