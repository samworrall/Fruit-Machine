class Machine
  attr_reader :jackpot, :slots

  def initialize(jackpot)
    @jackpot = jackpot
    @slots = ['Black', 'White', 'Green', 'Yellow']
  end

  def update_jackpot(value)
    @jackpot += value
  end
end
