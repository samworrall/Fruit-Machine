class Game
  attr_reader :machine, :player

  def initialize(machine, player)
    @machine = machine
    @player = player
  end

  def play
    @machine.spin
    if @machine.slots.uniq.length == 1
      @player.update_wallet(@machine.jackpot)
      @machine.update_jackpot(-(@machine.jackpot))
    else
      @player.update_wallet(-1)
      @machine.update_jackpot(1)
    end
  end
end
