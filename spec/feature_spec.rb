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
      it 'Increases the player wallet by half the jackpot' do
        expect{ game.play }.to change{ player.wallet }.by((machine.jackpot) / 2)
      end

      it 'Decreases the machine jackpot by half' do
        expect{ game.play }.to change{ machine.jackpot }.by(-((machine.jackpot) / 2))
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

      it 'Decreases the machine jackpot to 0' do
        expect{ game.play }.to change{ machine.jackpot }.by(-(machine.jackpot))
        expect(machine.jackpot).to eq(0)
      end
    end
  end

  # context 'Slot colours award no prize' do
  #   before(:each) do
  #     srand(5)
  #   end
  #
  #   describe 'Slot colours award no prize' do
  #
  #   end
  # end
end
