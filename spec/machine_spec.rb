require 'machine'

describe Machine, :machine do
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

  describe '#update_jackpot', :update_jackpot do
    it 'Increases the value of the machine jackpot' do
      expect{ subject.update_jackpot(1) }.to change{ subject.jackpot }.by(1)
    end

    it 'Decreases the value of the machine jackpot' do
      expect{ subject.update_jackpot(-1) }.to change{ subject.jackpot }.by(-1)
    end
  end

  describe '#slot_colours', :slot_colours do
    it 'Returns an array of colours' do
      expect(subject.slot_colours).to eq(['Black', 'White', 'Green', 'Yellow'])
    end
  end

  describe '#spin', :spin do
    it 'Returns an array of 4 colours' do
      expect(subject.spin.length).to eq(4)
    end
  end

  describe '#slots', :slots do
    it 'Begins empty' do
      expect(subject.slots).to be_empty
    end

    it 'Updates after a spin' do
      expect{ subject.spin }.to change{ subject.slots.length }.by(4)
    end
  end

  context 'All slots are equal' do
    before(:each) do
      srand(30)
    end

    describe '#all_slots_equal', :equal do
      it 'Returns true' do
        subject.spin
        expect(subject.all_slots_equal).to be(true)
      end
    end

    describe '#all_slots_unique', :unique do
      it 'Returns false' do
        subject.spin
        expect(subject.all_slots_unique).to be(false)
      end
    end
  end

  context 'All slots are unique' do
    before(:each) do
      srand(3)
    end

    describe '#all_slots_unique', :unique do
      it 'Returns true' do
        subject.spin
        expect(subject.all_slots_unique).to be(true)
      end
    end

    describe '#all_slots_equal', :equal do
      it 'Returns false' do
        subject.spin
        expect(subject.all_slots_equal).to be(false)
      end
    end

    describe '#two_or_more_adjacent_slots_equal', :two_or_more do
      it 'Returns false' do
        subject.spin
        expect(subject.two_or_more_adjacent_slots_equal).to be(false)
      end
    end
  end
end
