require 'player'

describe Player do
  let(:subject) { Player.new('Sam', 50) }

  context 'Different wallet value on initialisation' do
    let(:subject) { Player.new('Sam', 100) }

    describe '#initialize', :init do
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
end
