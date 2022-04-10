class WordFinder
  attr_reader :words

  def initialize(word_list_file_name:)
    @words = File.open(words).readlines.map(&:strip)
  end


end
