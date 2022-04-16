# Werds

# WERD

This Gem is meant to help you with word matcher games.

The initial version was for the games where you have a word like PREFECT and then have to find all the different word variants.

Some of these games lay the words out in a crossword-like structure, others just ask for the words ordered by size and alphabet.

This is the simple case. For Wordle style games you need to start from all letters and then start creating groups that are in the word, aren't in the word, and where they might appear in the word.

It uses a word list that was derived from the excellent tool [Scowl](http://wordlist.aspell.net/) with the command `./mk-list english british american 70 --accents strip > dictionary` - which gives is a list of several thousand words with no accents.

Usage

```ruby
wordfinder = Werd.new(source: 'pledge', match_pattern: '....')
wordfinder.words

[""]

```

This is saying you want to use the letters in the word pledge and find all words that are 4 characters long. Each `.` means use any letters from the source word, and the number of dots says how long. Source word doesn't have to be an actual word, it can be an combination of letters. If letters appear more than once then they should in the source word (for example `e` above).

```ruby
wordfinder = Werd.new(source_word: 'pledge', match_pattern: 'l..')
```


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'werds'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install werds

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/werds. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/werds/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Werds project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/werds/blob/master/CODE_OF_CONDUCT.md).
