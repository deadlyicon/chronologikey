# Chronologikey

generated keys based on a shared secret and the current time

## Installation

Add this line to your application's Gemfile:

    gem 'chronologikey'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install chronologikey

## Usage


  generate a secret

    secret = Chronologikey.generate_secret

  generate an encrypted token based on the current time

    token = Chronologikey.generate(secret)

  validate that token somewhere else

    Chronologikey.validate(secret, token) # => Boolean



## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
