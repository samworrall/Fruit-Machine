require 'game'

describe Game, :game do
  let(:subject) { Game.new(machine, player) }
  let(:machine) { double :machine }
  let(:player) { double :player }

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

  # describe '#play', :play do
  #   it 'Calls the update_wallet method on the player' do
  #     subject.play
  #     expect(player).to have_received(:update_wallet).once
  #   end
  # end
end
