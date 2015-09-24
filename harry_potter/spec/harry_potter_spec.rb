BOOK_PRICE = 8
TWO_BOOK_MODIFIER = 0.95
THREE_BOOK_MODIFIER = 0.9
FOUR_BOOK_MODIFIER = 0.8
FIVE_BOOK_MODIFIER = 0.75

def harry_potter(book_list)
  book_modifers = {
    1 => 1,
    2 => TWO_BOOK_MODIFIER,
    3 => THREE_BOOK_MODIFIER,
    4 => FOUR_BOOK_MODIFIER,
    5 => FIVE_BOOK_MODIFIER
  }

  number_of_unique_books = book_list.uniq.size
  number_of_duplicate_books = book_list.size - number_of_unique_books
  price_of_unique_books = (number_of_unique_books * BOOK_PRICE) * book_modifers.fetch(number_of_unique_books)
  price_of_duplicate_books = number_of_duplicate_books * BOOK_PRICE
  total_price = '%.2f' % (price_of_unique_books + price_of_duplicate_books)
  return "£" + total_price.to_s
end

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
