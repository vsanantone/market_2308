require './lib/item'

RSpec.describe Item do
  before(:each) do
    @item1 = Item.new({name: 'Peach', price: "$0.75"})
    @item2 = Item.new({name: 'Tomato', price: '$0.50'})

  end

  describe "#initialize" do
    it "exist" do
      expect(@item1).to be_a(Item)
      expect(@item2).to be_a(Item)
    end
  end

  it "has a name, and price" do
    expect(@item2.name).to eq("Tomato")
    expect(@item2.price).to eq(0.5)
  end
end