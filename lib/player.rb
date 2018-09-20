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
end
