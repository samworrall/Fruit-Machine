class Player
  attr_reader :wallet

  def initialize(wallet_size)
    @wallet = wallet_size
  end
end
