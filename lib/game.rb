class Game
  attr_reader :machine, :player

  def initialize(machine, player)
    @machine = machine
    @player = player
  end

  def play
    @machine.spin
    @player.update_wallet(-1)
    @machine.update_jackpot(1)
  end
end
