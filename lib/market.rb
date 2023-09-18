class Market
  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map(&:name)
    # @vendors.map { |vendor| vendor.name }
  end

  def vendors_that_sell(item)
    results = []
    @vendors.select do |vendor|
      vendor.inventory.keys.each do |key|
         results << vendor if key.name == item.name
      end
    end
    results 
  end

  def potential_revenue
    require 'pry'; binding.pry
  end
end