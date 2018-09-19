require 'game'
require 'machine'
require 'player'

describe 'Feature', :feature do
  let(:player) { Player.new('Sam', 50) }
  let(:machine) { Machine.new(100) }
  let(:game) { Game.new(machine, player) }

  context 'All slot colours are different' do
    before(:each) do
      srand(3)
    end

    describe 'All slot colours are different' do
      it 'Reduces the player wallet by 1' do
        expect{ game.play }.to change{ player.wallet }.by(-1)
      end

      it 'Increases the machine jackpot by 1' do
        expect{ game.play }.to change{ machine.jackpot }.by(1)
      end
    end
  end

  context 'All slot colours are the same' do
    before(:each) do
      srand(30)
    end

    describe 'All slot colours are the same' do
      it 'Increases the player wallet by the jackpot value' do
        expect{ game.play }.to change{ player.wallet }.by(machine.jackpot)
      end
    end
  end
end
