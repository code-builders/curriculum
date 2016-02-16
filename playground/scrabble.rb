module Scrabble
  class Word
    def self.scoring_table
      @table ||= begin
        table = {}
        %w(A E I O U L N R S T).each {|l| table[l] = 1 }
        %w(D G).each                 {|l| table[l] = 2 }
        %w(B C M P).each             {|l| table[l] = 3 }
        %w(F H V W Y).each           {|l| table[l] = 4 }
        %w(K).each                   {|l| table[l] = 5 }
        %w(J X).each                 {|l| table[l] = 8 }
        %w(Q Z).each                 {|l| table[l] = 10 }
        table
      end
    end

    def initialize(word)
      @word = word
    end

    def score
      # @word.chars.reduce(0) do |score,l|
      #   score + self.class.scoring_table[l.upcase]
      # end
      score   = 0
      @word.chars.each do |l|
        score += self.class.scoring_table[l.upcase]
      end
      score

    end

  end
end
