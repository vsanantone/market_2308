require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Vendor do
  before(:each) do
    @market = Market.new("South Pearl Street Farmers Market")  
    @vendor1 = Vendor.new("Rocky Mountain Fresh")
    @vendor2 = Vendor.new("Ba-Nom-a-Nom")
    @vendor3 = Vendor.new("Palisade Peach Shack") 
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})
    @item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
    @item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})
  end

  describe "#initialize" do
    it "exist" do
      expect(@market).to be_a(Market)
    end

    it "has a name" do
      expect(@market.name).to eq("South Pearl Street Farmers Market")
      expect(@market.vendors).to eq([])
    end
  end

  describe "#stock" do
    it "it stocks an item" do
      @vendor1.stock(@item1, 35)    
      @vendor1.stock(@item2, 7)  
      expect(@vendor1.inventory).to eq({@item1 => 35, @item2 => 7})
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      expect(@vendor2.inventory).to eq({@item4 => 50, @item3 => 25})
      @vendor3.stock(@item1, 65)
      expect(@vendor3.inventory).to eq({@item1 => 65})
    end
  end
  
  describe "#add_vendor" do
  it "it stocks an item" do
      expect(@market.vendors).to eq([])
      @market.add_vendor(@vendor1) 
      @market.add_vendor(@vendor2) 
      @market.add_vendor(@vendor3) 
      expect(@market.vendors).to eq([@vendor1, @vendor2, @vendor3])
    end
  end

  describe "#vendor_names" do
  it "it returns an array of vendor names" do
      expect(@market.vendors).to eq([])
      @market.add_vendor(@vendor1) 
      @market.add_vendor(@vendor2) 
      @market.add_vendor(@vendor3) 
      expect(@market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end
  
  describe "#vendors_that_sell" do
    it "returns an array of vendors that sell a particular item" do
      @market.add_vendor(@vendor1) 
      @market.add_vendor(@vendor2) 
      @market.add_vendor(@vendor3) 
      @vendor1.stock(@item1, 35)    
      @vendor1.stock(@item2, 7)  
      @vendor2.stock(@item4, 50)
      @vendor2.stock(@item3, 25)
      @vendor3.stock(@item1, 65)

      expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
      expect(@market.vendors_that_sell(@item4)).to eq([@vendor2])
    end
  end
  
  describe "#potential_revenue" do
  it "returns potentail revenue for selling all stock" do
    @market.add_vendor(@vendor1) 
    @market.add_vendor(@vendor2) 
    @market.add_vendor(@vendor3) 
    @vendor1.stock(@item1, 35)    
    @vendor1.stock(@item2, 7)  
    @vendor2.stock(@item4, 50)
    @vendor2.stock(@item3, 25)
    @vendor3.stock(@item1, 65)
  end
end

  describe "#sorted_item_list" do
    it "returns array of names of all items the Vendors have in stock, sorted alphabetically." do
  
      # expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
    end
  end

  describe "#total inventory" do
    it "returns the total inventory" do
      # expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])

    end
  end

  describe "#overstocked_items" do
    it "returns an array of `Item` objects that are overstocked." do
      # expect(@market.vendors_that_sell(@item1)).to eq([@vendor1, @vendor3])
    end
  end
end