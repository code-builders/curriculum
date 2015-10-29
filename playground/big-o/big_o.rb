class BigO
  attr_reader :data

  def initialize(data)
    @data = data
  end

  # O(1)
  def is_first_element_nil?
    @data[0] == nil
  end

  # O(n)
  def how_many_in_array(search_term)
    total = 0
    @data.each do |d|
      if d == search_term
        total += 1
      end
    end
    total
  end

  # trivial O(n²)
  def number_of_combos
    sum = 0
    @data.each do |x|
      @data.each do |y|
        sum += 1
      end
    end
    sum
  end

  # real world O(n²)
  def bubble_sort
    sorted = false
    until sorted do
      sorted = true
      (0..@data.size-2).each do |i|
        if @data[i] > @data[i + 1]
          temp         = @data[i]
          @data[i]     = @data[i + 1]
          @data[i + 1] = temp
          sorted = false
        end
      end
    end
    @data
  end

  # O(log n)
  def binary_search(search_term, data=nil)
    data ||= @data
    middle = data.size / 2
    return if data.empty?
    if search_term == data[middle]
      return data[middle]
    elsif search_term > data[middle]
      binary_search(search_term, data[middle+1..-1])
    elsif search_term < data[middle]
      binary_search(search_term, data[0..middle-1])
    end
  end

end
