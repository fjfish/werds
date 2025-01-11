# Werds

This Gem is meant to help you with word matcher games.

The initial version was for the games where you have a word like PREFECT and then have to find all the different word variants.

Some of these games lay the words out in a crossword-like structure, others just ask for the words ordered by size and alphabet.

It uses a word list that was derived from the excellent tool [Scowl](http://wordlist.aspell.net/) with the command `./mk-list english british american 70 --accents strip > dictionary` - which gives is a list of several thousand words with no accents.

Usage

```ruby
wordy = Werds.new(source:"pledge")
wordy.words(match_pattern: "....")
=> ["deep", "dele", "edge", "geed", "geld", "glee", "peed", "peel"]
```

This is saying you want to use the letters in the word pledge and find all words that are 4 characters long. Each `.` means use any letters from the source word, and the number of dots says how long. Source word doesn't have to be an actual word, it can be an combination of letters. If letters appear more than once then they should in the source word (for example `e` above).

If you know some of the letters than put them into the match pattern like so:

```ruby
wordy = Werds.new(source: "galaxy")
wordy.words(match_pattern: "..g.")
=> "alga"
```

A solver that works better for Wordle style games is planned.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "werds", git: "https://github.com/fjfish/werds"
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install werds

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in the gemspec, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag.

## Design considerations

At the moment this gem loads the entire dictionary into memory so that it can be interrogated over and over again without having to keep re-reading the file. This is quite a large file, however. Future iterations of this gem will probably have scripts to load the contents of the file into a database and fire the regular expressions at that database. For the first iteration of this gem, solving simple puzzles from the console, it is deemed adequate.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/fjfish/werds. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/fjfish/werds/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Werds project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/fjfish/werds/blob/master/CODE_OF_CONDUCT.md).
