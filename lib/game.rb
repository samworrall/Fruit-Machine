class Game
  attr_reader :machine, :player

  def initialize(machine, player)
    @machine = machine
    @player = player
  end

  def play
    @machine.spin
    if all_slots_equal
      @player.update_wallet(@machine.jackpot)
      @machine.update_jackpot(-(@machine.jackpot))
    elsif all_slots_unique
      @player.update_wallet(@machine.jackpot / 2)
      @machine.update_jackpot(-(@machine.jackpot / 2))
    elsif two_or_more_adjacent_slots_equal
      @player.update_wallet(5)
      @machine.update_jackpot(-5)
    else
      @player.update_wallet(-1)
      @machine.update_jackpot(1)
    end
  end

  private

  def all_slots_equal
    @machine.slots.uniq.length == 1
  end

  def all_slots_unique
    @machine.slots.uniq.length == 4
  end

  def two_or_more_adjacent_slots_equal
    @machine.slots[0] == @machine.slots[1] ||
    @machine.slots[1] == @machine.slots[2] ||
    @machine.slots[2] == @machine.slots[3]
  end
end
