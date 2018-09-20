require 'player'

describe Player, :player do
  let(:subject) { Player.new('Sam', 50) }

  context 'Different wallet value on initialisation' do
    let(:subject) { Player.new('Sam', 100) }

    describe '#wallet', :wallet do
      it 'Sets the players balance based on argument given on initialisation' do
        expect(subject.wallet).to eq(100)
      end
    end
  end

  describe '#name', :name do
    it 'Returns the player name' do
      expect(subject.name).to eq('Sam')
    end
  end

  describe '#wallet', :wallet do
    it 'Returns the value of the players wallet' do
      expect(subject.wallet).to eq(50)
    end
  end

  describe '#update_wallet', :update_wallet do
    it 'Increases the value of the player wallet' do
      expect{ subject.update_wallet(1) }.to change{ subject.wallet }.by(1)
    end

    it 'Decreases the value of the player wallet' do
      expect{ subject.update_wallet(-1) }.to change{ subject.wallet }.by(-1)
    end
  end

  describe '#free_spins', :free_spins do
    it 'Begins at 0' do
      expect(subject.free_spins).to eq(0)
    end
  end
end
