class Werds
  class Error < StandardError; end

  attr_reader :source, :match_pattern, :dictionary_name

  def initialize(source:, match_pattern:, dictionary_name: "data/dictionary")
    @source = source
    @match_pattern = match_pattern
    @dictionary_name = dictionary_name
  end

  def words
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
    return @search_string if @search_string
    matched_letters = match_pattern.gsub(".", "")
    unmatched_letters = source.dup
    if matched_letters.length > 0
      # sub to only get the first/nth one so re will still match on other occurrences
      matched_letters.each_char { |l| unmatched_letters.sub!(l, "") }
    end
    @search_string = match_pattern.gsub(".", "[#{unmatched_letters}]")
  end

  def re
    @re ||= Regexp.new("^#{search_string}$")
  end

  def make_mask string
    county = {}
    string.each_char do |c|
      county[c] ||= 0
      county[c] += 1
    end
    county
  end

  def apply_mask string, mask
    county = {}
    string.each_char do |c|
      county[c] ||= 0
      county[c] += 1
      return false if county[c] > mask[c]
    end
    true
  end

end
