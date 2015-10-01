class HarryPotterOffer
  def add(book_list)
    book_list.sort!
    unique_groups = create_uniqe_groups(book_list)
    test_for_edge_case(unique_groups)
    total_price = get_total_price(unique_groups)
    format_price(total_price)
  end

  def create_uniqe_groups(book_list)
    unique_groups = []

    while book_list.uniq.size < book_list.size do
      unique_list = book_list.uniq
      unique_groups << unique_list
      unique_list.each_with_index do |item|
        i = book_list.find_index(item)
        book_list.delete_at(i)
      end
    end

    unique_groups << book_list
  end

  def get_total_price(unique_groups)
    unique_groups.inject(0) do |sum, item|
      price = calculate_price(item)
      sum + price
    end
  end

  def calculate_price(book_list)
    (book_list.size * book_price) * price_modifiers.fetch(book_list.size)
  end

  def format_price(total_price)
    "£" + ('%.2f' % total_price)
  end

  def book_price
    8
  end

  def price_modifiers
    {
      1 => 1,
      2 => 0.95,
      3 => 0.9,
      4 => 0.8,
      5 => 0.75
    }
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

    test_finished = false
    while test_finished == false do
      five_location = -1
      three_location = -1
      unique_groups.each_with_index do |item, index|
        if item.size == 5
          five_location = index
          break
        end
      end
      if five_location >= 0
        unique_groups.each_with_index do |item, index|
          if item.size == 3
            three_location = index
            break
          end
        end
        if three_location >= 0
          unique_groups[five_location].each_with_index do |item, index|
            if unique_groups[three_location].include?(item) == false
              unique_groups[three_location].push(item)
              unique_groups[five_location].delete_at(index)
              break
            end
          end
        end
      end
      if five_location == -1 || three_location == -1
        break
      end
    end
  end
end
