require 'machine'

describe Machine do
  let(:subject) { Machine.new(500) }

  describe '#jackpot', :jackpot do
    it 'Returns the current machine jackpot' do
      expect(subject.jackpot).to eq(500)
    end
  end
end
