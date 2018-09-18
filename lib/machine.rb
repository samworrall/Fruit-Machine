class Machine
  attr_reader :jackpot, :slot_colours, :slots

  def initialize(jackpot)
    @jackpot = jackpot
    @slot_colours = ['Black', 'White', 'Green', 'Yellow']
    @slots = []
  end

  def update_jackpot(value)
    @jackpot += value
  end

  def spin
    result = []
    4.times { result << @slot_colours.sample }
    @slots = result
  end
end
