class Search

  def initialize(sentences)
    @indexed_sentences = {}
    sentences.each do |sentence|
      sentence.split.each do |word|
        @indexed_sentences[word] ||= []
        @indexed_sentences[word] << sentence
      end
    end
  end

  def search(word)
    @indexed_sentences[word]
  end

end
