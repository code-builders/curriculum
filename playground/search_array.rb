class SearchArray

  def initialize(arr)
    @data = arr
  end

  def find_element(query)
    index = 0
    while index < @data.length
      return query if @data[index] == query
      index += 1
    end
  end

  def delete_element(query)
    index = 0
    while index < @data.length
      return @data.delete_at(index) if @data[index] == query
      index += 1
    end
  end

end
