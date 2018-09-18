require 'machine'

describe Machine do
  let(:subject) { Machine.new(500) }

  context 'Different jackpot value on initialisation' do
    let(:subject) { Machine.new(1000) }

    describe '#jackpot', :jackpot do
      it 'Returns the jackpot set as argument on initialisation' do
        expect(subject.jackpot).to eq(1000)
      end
    end
  end

  describe '#jackpot', :jackpot do
    it 'Returns the current machine jackpot' do
      expect(subject.jackpot).to eq(500)
    end
  end
end
