class Machine
  attr_reader :jackpot, :slot_colours

  def initialize(jackpot)
    @jackpot = jackpot
    @slot_colours = ['Black', 'White', 'Green', 'Yellow']
  end

  def update_jackpot(value)
    @jackpot += value
  end

  def spin
    result = []
    4.times { result << @slot_colours.sample }
    result
  end
end
