require 'player'

describe Player do
  describe '#wallet' do
    it 'Returns the value of the players wallet' do
      expect(subject.wallet).to eq(50)
    end
  end
end
