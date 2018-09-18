require 'game'

describe Game, :game do
  let(:subject) { Game.new(machine, player) }
  let(:machine) { spy :machine }
  let(:player) { spy :player }

  describe '#machine', :gane_machine do
    it 'Returns the machine' do
      expect(subject.machine).to eq(machine)
    end
  end

  describe '#player', :game_player do
    it 'Returns the player' do
      expect(subject.player).to eq(player)
    end
  end

  describe '#play', :play do
    it 'Calls the update_wallet method on the player' do
      subject.play
      expect(player).to have_received(:update_wallet).once
    end

    it 'Calls the update_jackpot method on the machine' do
      subject.play
      expect(machine).to have_received(:update_jackpot).once
    end

    it 'Calls the spin method on the machine' do
      subject.play
      expect(machine).to have_received(:spin).once
    end
  end
end
