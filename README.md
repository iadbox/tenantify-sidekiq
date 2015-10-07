# Tenantify::Sidekiq

This gem provides a client and a server middlewares for Sidekiq to work with the tenantify gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tenantify-sidekiq'
```

And then execute:

    $ bundle

## Usage

Just add the client and the server middlewares to its respective middleware chains:

```ruby
require 'tenantify-sidekiq'

Sidekiq.configure_client do |config|
  config.client_middleware do |chain|
    chain.add Tenantify::Sidekiq::Middlewares::Client
  end
end

Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    chain.add Tenantify::Sidekiq::Middlewares::Server
  end
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/tenantify-sidekiq/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
