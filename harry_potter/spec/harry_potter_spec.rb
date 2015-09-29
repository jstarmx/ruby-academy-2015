require 'harry_potter'

RSpec.describe "Harry Potter Calculator" do

  it "returns the price of one book" do
    expect(harry_potter([1])).to eq("£8.00")
  end

  it "returns the price of two different books" do
    expect(harry_potter([1,2])).to eq("£15.20")
  end

  it "returns the price of three different books" do
    expect(harry_potter([2,3,5])).to eq("£21.60")
  end

  it "returns the price of four different books" do
    expect(harry_potter([1,2,4,5])).to eq("£25.60")
  end

  it "returns the price of five different books" do
    expect(harry_potter([1,2,3,4,5])).to eq("£30.00")
  end

  it "does not discount duplicate books" do
    expect(harry_potter([1,2,2])).to eq("£23.20")
  end

  it "finds the biggest discount in a selection of books" do
    expect(harry_potter([1,1,2,2])).to eq("£30.40")
    expect(harry_potter([1,1,2,2,3,3,4,5])).to eq("£51.20")
  end

end
