# Vindsl

Vindsl (pronounced like the Fast and Furious star) is a tool for looking up
information about cars.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vindsl'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vindsl

## Usage

```ruby
v = Vindsl::VIN.new '1ZVBP8AM7C5280000'

v.country #=> 'United States'
v.manufacturer #=> 'Ford'
```

## Contributing

1. Fork it ( https://github.com/bkerley/vindsl/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write some RSpecs
5. Implement your feature
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
