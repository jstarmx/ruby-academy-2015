BOOK_PRICE = 8
BOOK_MODIFIERS = {
  1 => 1,
  2 => 0.95,
  3 => 0.9,
  4 => 0.8,
  5 => 0.75
}

# def calculate_price(book_list)
#   number_of_unique_books = book_list.uniq.size
#   number_of_duplicate_books = book_list.size - number_of_unique_books
#   price_of_unique_books = (number_of_unique_books * BOOK_PRICE) * BOOK_MODIFIERS.fetch(number_of_unique_books)
#   price_of_duplicate_books = number_of_duplicate_books * BOOK_PRICE
#   total_price = '%.2f' % (price_of_unique_books + price_of_duplicate_books)
#
#   return total_price
# end

def calculate_price(book_list)
  price_of_books = (book_list.size * BOOK_PRICE) * BOOK_MODIFIERS.fetch(book_list.size)
  return price_of_books
end

def harry_potter(book_list)
  book_list.sort!
  # total_price = calculate_price(book_list)
  unique_groups = []

  while book_list.uniq.size < book_list.size do
    unique_list = book_list.uniq
    unique_groups << unique_list
    unique_list.each do |item|
      i = book_list.find_index(item)
      book_list.delete_at(i)
    end
  end

  unique_groups << book_list

  p unique_groups

  total_price = unique_groups.inject(0) do |sum, item|
    price = calculate_price(item)
    sum + price
  end

  return "£" + ('%.2f' % total_price)
end

RSpec.describe "Harry Potter Calculator" do

  # it "returns the price of one book" do
  #   expect(harry_potter([1])).to eq("£8.00")
  # end
  #
  # it "returns the price of two different books" do
  #   expect(harry_potter([1,2])).to eq("£15.20")
  # end
  #
  # it "returns the price of three different books" do
  #   expect(harry_potter([2,3,5])).to eq("£21.60")
  # end
  #
  # it "returns the price of four different books" do
  #   expect(harry_potter([1,2,4,5])).to eq("£25.60")
  # end
  #
  # it "returns the price of five different books" do
  #   expect(harry_potter([1,2,3,4,5])).to eq("£30.00")
  # end
  #
  # it "does not discount duplicate books" do
  #   expect(harry_potter([1,2,2])).to eq("£23.20")
  # end

  it "finds the biggest discount in a selection of books" do
    # expect(harry_potter([1,1,2,2])).to eq("£30.40")
    expect(harry_potter([1,1,2,2,3,3,4,5])).to eq("£51.20")
  end

end
