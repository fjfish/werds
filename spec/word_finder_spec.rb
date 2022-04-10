require 'rspec'

describe 'WordFinder' do
  let(:subject) { WordFinder.new(word_list_file_name: "/usr/share/dict/words") }
  before do
    # Do nothing
  end

  after do
    # Do nothing
  end

  it 'find a simple word' do
    subject.letters = "pcates"
    expect(subject.candidates).to contain("pact")
  end
end
