class Tweet

  # scope :search, lambda { |term| where("text LIKE ? OR username LIKE ? OR in_reply_to LIKE ?", term, term, term) }

  # attr_writer :text # same as 12-14
  # attr_reader :text # same as 16-18
  # attr_accessor :text # same as 12-18
  
  def initialize(text, username)
    @text     = text
    @username = username
  end

  # def text=(t)
  #   @text = t
  # end

  # def text
  #   @text
  # end

  def from_user?(u)
    @username == u
  end

  def self.refresh
    # Twitter::API.search.each do |tweet|
    #   self.new(tweet)
    # end
    "Search twitter"
  end

  def self.search(term)
    []
  end

end

# new(var)
# creates that object in memory
# calls initialize on that object
# returns object
