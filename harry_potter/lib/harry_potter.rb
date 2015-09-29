BOOK_PRICE = 8
BOOK_MODIFIERS = {
  1 => 1,
  2 => 0.95,
  3 => 0.9,
  4 => 0.8,
  5 => 0.75
}

def calculate_price(book_list)
  price_of_books = (book_list.size * BOOK_PRICE) * BOOK_MODIFIERS.fetch(book_list.size)
  return price_of_books
end

def test_for_edge_case(unique_groups)
  group_sizes = []
  five_location = -1
  three_location = -1
  unique_groups.each_with_index do |item, index|
    if item.size == 5
      five_location = index
    elsif item.size == 3
      three_location = index
    end
  end

  if five_location >= 0 && three_location >= 0
    item_to_move = unique_groups[five_location].pop
    unique_groups[three_location].push(item_to_move)
  end
end

def create_uniqe_groups(book_list)
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
  return unique_groups
end

def harry_potter(book_list)
  book_list.sort!
  unique_groups = create_uniqe_groups(book_list)

  test_for_edge_case(unique_groups)

  total_price = unique_groups.inject(0) do |sum, item|
    price = calculate_price(item)
    sum + price
  end

  return "£" + ('%.2f' % total_price)
end
