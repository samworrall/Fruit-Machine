class Machine
  attr_reader :jackpot

  def initialize(jackpot)
    @jackpot = jackpot
  end

  def update_jackpot(value)
    @jackpot += value
  end
end
