class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name       = name 
    @inventory  = Hash.new(0)
  end

  # def check_stock(item)
  #   if @inventory.has_key?(item)
  #     return @inventory[item]
  #   else
  #     return 0
  #   end
  # end

  def check_stock(item)
    @inventory.keys.include?(item)? @inventory[item] : 0
  end

  def stock(item, amount)
    @inventory[item] += amount
  end

end