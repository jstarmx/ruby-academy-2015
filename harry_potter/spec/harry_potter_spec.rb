require 'harry_potter'

RSpec.describe "Harry Potter Calculator" do

  it "returns the price of one book" do
    harry_potter_offer = HarryPotterOffer.new
    expect(harry_potter_offer.add([1])).to eq("£8.00")
  end

  it "returns the price of two different books" do
    harry_potter_offer = HarryPotterOffer.new
    expect(harry_potter_offer.add([1,2])).to eq("£15.20")
  end

  it "returns the price of three different books" do
    harry_potter_offer = HarryPotterOffer.new
    expect(harry_potter_offer.add([2,3,5])).to eq("£21.60")
  end

  it "returns the price of four different books" do
    harry_potter_offer = HarryPotterOffer.new
    expect(harry_potter_offer.add([1,2,4,5])).to eq("£25.60")
  end

  it "returns the price of five different books" do
    harry_potter_offer = HarryPotterOffer.new
    expect(harry_potter_offer.add([1,2,3,4,5])).to eq("£30.00")
  end

  it "does not discount duplicate books" do
    harry_potter_offer = HarryPotterOffer.new
    expect(harry_potter_offer.add([1,2,2])).to eq("£23.20")
  end

  it "finds the biggest discount in a selection of books" do
    harry_potter_offer = HarryPotterOffer.new
    expect(harry_potter_offer.add([1,1,2,2])).to eq("£30.40")
    expect(harry_potter_offer.add([1,1,2,2,3,3,4,5])).to eq("£51.20")
    expect(harry_potter_offer.add([1,1,2,2,3,3,4,5,1,1,2,2,3,3,4,5])).to eq("£102.40")
    expect(harry_potter_offer.add([
      1, 1, 1, 1, 1,
      2, 2, 2, 2, 2,
      3, 3, 3, 3,
      4, 4, 4, 4, 4,
      5, 5, 5, 5
    ])).to eq("£141.20") # 3 * (8 * 5 * 0.75) + 2 * (8 * 4 * 0.8)
  end

end
