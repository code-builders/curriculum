class MissingNumbers

  def initialize(list)
    @list = list
  end

  def missing_numbers
    i = 0
    missing = []
    @list.min.upto(@list.max).each do |n|
      if @list[i] == n
        i += 1
      else
        missing << n
      end
    end
    missing
  end
end
