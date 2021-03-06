# Occupator

Occupator is a gem, handling recurring events in Ruby. It gives you a
comprehensive structure and an easy DSL.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'occupator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install occupator

## Usage

Events can be defined as POROs or other ruby object that responds to `call`.
So you can have something like:
```ruby
class EventObject
  include Occupator

  def self.call
    #perform any recurring action
  end
end
```
or
```ruby
RecurringEvent = -> () { 'some reccuring event' }
```
You can list all your events in a single file (or whatever you choose),
where they can be evaluated during run time (a config file or an
initializer in Rails will do the trick, for example)

```ruby
EventObject1.occupy(every: :day)
EventObject2.occupy(every: :week)
EventObject3.occupy(every: :month)
EventObject4.occupy(every: :year)
```

You can configure the `Occupator` gem by using its config property:
```ruby
Occupator.configure do |config|
  config.default_at = '06.00'
  config.call_method = :call
  config.some_option = :blah
  config.dump_style = String
end
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Stefan Slaveykov/occupator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

