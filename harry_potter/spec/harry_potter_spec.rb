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

  number_of_books = book_list.size
  price_of_books = '%.2f' % ((number_of_books * BOOK_PRICE) * book_modifers.fetch(number_of_books))
  return "£" + price_of_books.to_s
end

RSpec.describe "Harry Potter Calculator" do

  it "returns the price of one book" do
    expect(harry_potter([1])).to eq("£8.00")
  end

  it "returns the price of two different books" do
    expect(harry_potter([1,2])).to eq("£15.20")
  end

end
