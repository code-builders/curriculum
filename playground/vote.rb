class Vote
  $total = 0

  def initialize
    $total += 1
  end

  def self.vote_for(name)
    # vote for a person
    $total += 1
  end

  def self.total_votes
    $total
  end
end
