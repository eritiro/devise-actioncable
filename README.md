# Devise::Actioncable

Use this to work with devise and actioncable.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'devise-actioncable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devise-actioncable

## Usage

Add the following line to your base Connection
```ruby
  glue_devise
```

The file should look like this

```ruby
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    glue_devise
    identified_by :current_user

    def connect
      authenticate_user!
    end
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/eritiro/devise-actioncable.


## License

The gem is available as open source under the terms of the GNU license.
