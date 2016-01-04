class CharCount

  def initialize(word)
    @word = word
  end

  def valid?
    counts = {}
    @word.chars.each do |c|
      counts[c] ||= 0 # if !counts.has_key?(c)
      counts[c] += 1
    end

    # counts.all? {|v| v == counts.values.first }

    counts.values.each do |v|
      if v != counts.values.first
        return false
      end
    end
    true
  end
end
