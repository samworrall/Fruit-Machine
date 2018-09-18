class Player
  attr_reader :name, :wallet

  def initialize(name, wallet_size)
    @name = name
    @wallet = wallet_size
  end
end
