require 'fakeweb'

FakeWeb.allow_net_connect = false

def fixture_file(filename)
  return '' if filename == ''

  file_path = File.join(File.expand_path(File.dirname(__FILE__)), '../', 'fixtures/', filename)
  File.read(file_path)
end

def register_uri(url, file, method = :get)
  FakeWeb.register_uri(method, url, response: fixture_file(file))
end

register_uri('https://api.mailinator.com/api/inbox?to=abcd1234&token=ABCD', 'inbox.response')
register_uri('https://api.mailinator.com/api/email?msgid=abcd1234&token=ABCD', 'email.response')
register_uri('https://api.mailinator.com/api/email?msgid=1419696967-44152505-recipient&token=ABCD', 'email.response')
register_uri('https://api.mailinator.com/api/not-found?token=ABCD', 'not-found.response')
register_uri('https://api.mailinator.com/api/error?token=ABCD', 'error.response')
