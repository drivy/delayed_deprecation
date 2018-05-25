# DelayedDeprecation

This gem provides a simple way to setup delayed deprecation notices.

This can be useful to remind you to cleanup a piece of code, for instance
if you release in multiple steps. It's also an alternative to FIXME comments that
will actually warn you when running your test suite.

[![Gem Version](https://badge.fury.io/rb/delayed_deprecations.svg)](https://badge.fury.io/rb/delayed_deprecations)
[![CircleCI](https://circleci.com/gh/drivy/delayed_deprecations.svg?style=svg)](https://circleci.com/gh/drivy/delayed_deprecations)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'delayed_deprecation'
```

_Please note that because of a current dependency to activesupport this gem is
optimised to be used with Ruby on Rails._

## Usage

You can use it as a one liner:

```ruby
DelayedDeprecation.new("Only for launch", reconsider_after: Date.new(2017, 10, 1), owner: "Alice")
```

Or pass it a block:

```ruby
DelayedDeprecation.new("To refactor", reconsider_after: Date.new(2017, 10, 1), owner: "Bob") do
  # Code to be executed
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drivy/delayed_deprecation.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
