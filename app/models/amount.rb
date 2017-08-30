class Amount
  #constant variable because setting the prices in the
  DEFAULT_PRICE = 10_00

  def self.default
    DEFAULT_PRICE
  end

  #both styles will work and return the needed amounts
  def self.premium
    15_00
  end
end
