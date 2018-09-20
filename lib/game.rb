class Game
  attr_reader :machine, :player

  def initialize(machine, player)
    @machine = machine
    @player = player
  end

  def play
    @machine.spin
    if @machine.all_slots_equal
      @player.update_wallet(@machine.jackpot)
      @machine.update_jackpot(-(@machine.jackpot))
    elsif @machine.all_slots_unique
      @player.update_wallet(@machine.jackpot / 2)
      @machine.update_jackpot(-(@machine.jackpot / 2))
    elsif @machine.two_or_more_adjacent_slots_equal
      @player.update_wallet(5)
      @machine.update_jackpot(-5)
    else
      @player.update_wallet(-1)
      @machine.update_jackpot(1)
    end
  end
end
