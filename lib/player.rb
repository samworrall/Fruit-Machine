class Player
  attr_reader :name, :wallet

  def initialize(name, wallet_size)
    @name = name
    @wallet = wallet_size
  end

  def update_wallet(value)
    @wallet += value
  end
end
