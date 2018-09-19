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
      it 'Displays the slot colours to stdout' do
        expect{ game.play }.to output("[\"White\", \"White\", \"White\", \"White\"]\n").to_stdout
      end

      it 'Increases the player wallet by the jackpot value' do
        expect{ game.play }.to change{ player.wallet }.by(machine.jackpot)
      end

      it 'Decreases the machine jackpot to 0' do
        expect{ game.play }.to change{ machine.jackpot }.by(-(machine.jackpot))
        expect(machine.jackpot).to eq(0)
      end
    end
  end

  context 'Slot colours award no prize' do
    before(:each) do
      srand(5)
    end

    describe 'Slot colours award no prize' do
      it 'Decreases the player wallet by 1' do
        expect{ game.play }.to change{ player.wallet }.by(-1)
      end

      it 'Increases the machine jackpot by 1' do
        expect{ game.play }.to change{ machine.jackpot }.by(1)
      end
    end
  end

  context 'Slots have two or more adjacent equal colours' do
    before(:each) do
      srand(4)
    end

    describe 'Slots have two or more adjacent equal colours' do
      it 'Increases the player wallet by 5' do
        expect{ game.play }.to change{ player.wallet }.by(5)
      end

      it 'Decreases the machine jackpot by 5' do
        expect{ game.play }.to change{ machine.jackpot }.by(-5)
      end
    end
  end
end
