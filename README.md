# Ruby CLI NFL Ticket Generator 

This program allows a user to retrieve information on NFL games based on a specific team. The user will input their desired team naem which is then used by the Ticketmaster API to retrieve infomration on all games available for that team. :football:

## Dependencies
### Install Xcode Tools
`xcode-select --install`

### Install [Homebrew](http://brew.sh/)
`/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

### Install [RVM](https://rvm.io/)
`\curl -sSL https://get.rvm.io | bash -s stable`

### Install [Ruby](https://www.ruby-lang.org/en/)
`rvm install 2.6.1`

### Install [Bundler](http://bundler.io/)
`gem install bundler`

## Installation
### Get the code
`git clone git@github.com:JTSwisher/nfl_tickets.git`

### Use the correct ruby version
`rvm use 2.6.1`

### Run program 
`ruby bin/run`


Add this line to your application's Gemfile:

```ruby
gem 'nfl_tickets'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nfl_tickets

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'remarkable-assembler-1904'/nfl_tickets. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the NflTickets project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'remarkable-assembler-1904'/nfl_tickets/blob/master/CODE_OF_CONDUCT.md).
