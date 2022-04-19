# frozen_string_literal: true

RSpec.describe Werds do
  context "search_string" do
    it "creates generic search string" do
      finder =  Werds.new(source: "falafel")
      finder.words(match_pattern: "...")
      expect(finder.search_string).to eq("[falafel]" * 3)
    end
    it "allows specification of letter" do
      finder =  Werds.new(source: "falafel")
      finder.words(match_pattern: "f..")
      expect(finder.search_string).to eq("f" + ("[alafel]" * 2))
    end
  end
end
