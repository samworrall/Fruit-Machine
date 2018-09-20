class Player
  attr_reader :name, :wallet, :free_spins

  def initialize(name, wallet_size)
    @name = name
    @wallet = wallet_size
    @free_spins = 0
  end

  def update_wallet(value)
    @wallet += value
  end

  def update_free_spins(value)
    @free_spins += value
  end

  def check_wallet
    raise('You do not have enough credits to spin!') if @wallet == 0
  end
end
