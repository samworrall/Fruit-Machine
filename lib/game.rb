class Game
  attr_reader :machine, :player

  def initialize(machine, player)
    @machine = machine
    @player = player
  end

  def play
    @player.check_wallet
    @machine.spin
    if @machine.all_slots_equal
      pay_out_jackpot
    elsif @machine.all_slots_unique
      payout_half_jackpot
    elsif @machine.two_or_more_adjacent_slots_equal
      payout_5_credits
    else
      standard_spin
    end
  end

  private

  def jackpot
    @machine.jackpot
  end

  def half_jackpot
    @machine.jackpot / 2
  end

  def pay_out_jackpot
    @player.update_wallet(jackpot)
    @machine.update_jackpot(-jackpot)
  end

  def payout_half_jackpot
    @player.update_wallet(half_jackpot)
    @machine.update_jackpot(-half_jackpot)
  end

  def payout_5_credits
    if jackpot < 5
      @player.update_free_spins(5 - jackpot)
      @machine.update_jackpot(-jackpot)
    else
      @player.update_wallet(5)
      @machine.update_jackpot(-5)
    end
  end

  def standard_spin
    @player.update_wallet(-1)
    @machine.update_jackpot(1)
  end
end
