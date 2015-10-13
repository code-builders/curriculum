class Chair
  attr_accessor :name, :weight, :color, :height, :rolls, :created_at

  def initialize(attrs={})
    # attrs is a hash
    # {height: 30, name: "Vilgot", rolls: true}
    @name       = attrs[:name]
    @weight     = attrs[:weight]
    @color      = attrs[:color]
    @height     = attrs[:height]
    @rolls      = attrs[:rolls]
    @created_at = attrs[:created_at]
    # @name   = n
    # @weight = w
  end

end
