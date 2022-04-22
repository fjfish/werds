class Werds
  class Error < StandardError; end

  attr_reader :source, :match_pattern, :dictionary_name

  ELIPSIS = "…".freeze

  def initialize(source:, dictionary_name: File.expand_path(File.dirname(__FILE__)) + "/../data/dictionary")
    @source = source.gsub(/[[:space:]]/, '').downcase
    @dictionary_name = dictionary_name
  end

  def words(match_pattern:)
    @match_pattern = match_pattern.gsub(ELIPSIS,'...').gsub(/[[:space:]]/, '').downcase
    mask = make_mask source
    [].tap do |strings|
      IO.foreach(dictionary_name, chomp: true) do |s|
        strings << s if re.match(s) && apply_mask(s, mask)
      end
    end
  end

  # private

  def letter_count
    @letter_count ||= match_pattern.length
  end

  def search_string
    matched_letters = match_pattern.gsub(".", "")
    unmatched_letters = source.dup
    if matched_letters.length > 0
      # sub to only get the first/nth one so re will still match on other occurrences
      matched_letters.each_char { |l| unmatched_letters.sub!(l, "") }
    end
    match_pattern.gsub(".", "[#{unmatched_letters}]")
  end

  def re
    Regexp.new("^#{search_string}$")
  end

  def make_mask string
    letter_counts = {}
    string.each_char do |c|
      letter_counts[c] ||= 0
      letter_counts[c] += 1
    end
    letter_counts
  end

  def apply_mask string, mask
    letter_counts = {}
    string.each_char do |c|
      letter_counts[c] ||= 0
      letter_counts[c] += 1
      return false if letter_counts[c] > mask[c]
    end
    true
  end

end
