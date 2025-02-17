<img src="https://avatars.githubusercontent.com/u/22528478?s=200&v=4" alt="Paubox" width="150px">

# Paubox Rails

This gem extends the [Paubox Ruby Gem](https://github.com/paubox/paubox_ruby) for use with ActionMailer in Ruby on Rails.

The Paubox Email API allows your application to send secure, HIPAA compliant email via Paubox and track deliveries and opens.

## Scan.com fork

The gem is essentially abandonware, with the last (minor) updates occurring 4 years ago. We seem to rely on it and have
to use a hotfix branch (hotfix/PAUB-3205_secure_contact_broken_attachments) to make it work. This is causing problems
with gems that are installed via our private Github rubygems repo. To wit, the Personal Authentication Token (PAT)
needed to pull gems from our packages repo seem to stop bundler from downloading and buliding the gem from Paubox repo.

To fix this problem, I have forked the original repo, rebased the hotfix into `master`, built the gem and pushed it to
our github rubygems. I'm going to try and make it public, as that is how we use it now. I will update this once I know
the outcome.

## Compatibility
This gem has been tested and confirmed working with Rails 4-6

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'paubox_rails'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install paubox_rails


### Getting Paubox API Credentials
You will need to have a Paubox account. You can [sign up here](https://www.paubox.com/join/see-pricing?unit=messages).

Once you have an account, follow the instructions on the Rest API dashboard to verify domain ownership and generate API credentials.

### Configuring API Credentials
Create a new file at config/initializers/paubox.rb and add the following.
```ruby
Paubox.configure do |config|
  config.api_key = ENV['PAUBOX_API_KEY']
  config.api_user = ENV['PAUBOX_API_USER']
end
```

Note: Keep your unencrypted API credentials out of version control. Set as environment variables in a file that's not checked into version control, such as config/application.yml or config/secrets.yml. Better yet, use Rails Encrypted Secrets.


### Setting ActionMailer Delivery Method

Add the following to the configuration block in config/application.rb or the desired environment config in config/environments (e.g. config/environments/production.rb for production.)
```ruby
config.action_mailer.delivery_method = :paubox
```

## Usage

You can use [Action Mailer](https://guides.rubyonrails.org/action_mailer_basics.html) as you normally would in a Rails app.

See the [Paubox Ruby Gem](https://github.com/Paubox/paubox_ruby) for more advanced usage examples.

## Allowing non-TLS message delivery with Action Mailer

Set ``allow_non_tls`` to true in the ``delivery_method_options`` hash argument and pass this into the mailer action.

For example:

```ruby
class UserMailer < ApplicationMailer
  def welcome_email
    @user = params[:user]
    @url  = user_url(@user)
    delivery_options = { allow_non_tls: true }
    mail(to: @user.email,
         subject: "Welcome!",
         delivery_method_options: delivery_options)
  end
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/paubox/paubox-rails.


## License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Copyright
Copyright &copy; 2022, Paubox, Inc.
