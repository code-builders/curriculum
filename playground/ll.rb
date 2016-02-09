class LL
  attr_accessor :value, :nxt
  def initialize(value, nxt=nil)
    @value = value
    @nxt   = nxt
  end

  def search(value)
    if self.value == value
      self
    else
      return nxt if nxt.nil?
      nxt.search(value)
    end
  end

  def each(&block)
    block.call(value)
    return nil if nxt.nil?
    nxt.each(&block)
  end
end
