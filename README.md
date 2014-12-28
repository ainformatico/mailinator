# Mailinator

Mailinator REST API wrapper, http://mailinator.com/apidocs.jsp

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mailinator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mailinator

## Usage

### Configuration

```ruby
Mailinator.configure do |config|
  config.token = 'YOURTOKEN'
end
```

### Email

Access to an email

```ruby
email = Mailinator::Email.get('email-abcd1234')
```

Now you have access to some methods:

* `email.id`
* `email.body`
* `email.body_html`
* `email.read?`
* `email.inbox_fetches_left`
* `email.email_fetches_left`
* `email.sender`
* `email.reply_to`
* `email.from`
* `email.ip`
* `email.received`
* `email.date`
* `email.time`
* `email.forwards_left`
* `email.original`, original request

### Inbox

Access to an inbox

```ruby
inbox = Mailinator::Inbox.get('inbox-abcd1234')
```

This returns a list of the emails for the given _inbox_, but not the emails themselves.
To download an `Email` you need:

```ruby
email = inbox.first.download
```

or

```ruby
inbox.first.download do |email|
  [...]
end
```

## Contributing

1. Fork it ( https://github.com/ainformatico/mailinator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

Copyright (c) 2014 Alejandro Dev.

MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
