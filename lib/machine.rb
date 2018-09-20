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
    p @slots = result
  end

  def all_slots_equal
    @slots.uniq.length == 1
  end

  def all_slots_unique
    @slots.uniq.length == 4
  end

  def two_or_more_adjacent_slots_equal
    @slots[0] == @slots[1] || @slots[1] == @slots[2] || @slots[2] == @slots[3]
  end
end
