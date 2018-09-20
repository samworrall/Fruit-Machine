class Game
  attr_reader :machine, :player

  def initialize(machine, player)
    @machine = machine
    @player = player
  end

  def play
    @machine.spin
    if @machine.all_slots_equal
      @player.update_wallet(jackpot)
      @machine.update_jackpot(-(jackpot))
    elsif @machine.all_slots_unique
      @player.update_wallet(half_jackpot)
      @machine.update_jackpot(-(half_jackpot))
    elsif @machine.two_or_more_adjacent_slots_equal
      @player.update_wallet(5)
      @machine.update_jackpot(-5)
    else
      @player.update_wallet(-1)
      @machine.update_jackpot(1)
    end
  end

  private

  def jackpot
    @machine.jackpot
  end

  def half_jackpot
    @machine.jackpot / 2
  end
end
