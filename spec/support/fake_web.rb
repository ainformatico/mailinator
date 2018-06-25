require 'fakeweb'

FakeWeb.allow_net_connect = false

def fixture_file(filename)
  return '' if filename == ''
  file_path = File.join(File.expand_path(File.dirname(__dir__)) + '/support', '../', 'fixtures/', filename)
  File.read(file_path)
end

def register_uri(url, file, method = :get)
  FakeWeb.register_uri(method, url, response: fixture_file(file))
end

register_uri('https://api.mailinator.com/api/inbox?to=abcd1234&token=ABCD', 'inbox.response')
register_uri('https://api.mailinator.com/api/email?msgid=abcd1234&token=ABCD', 'email.response')
register_uri('https://api.mailinator.com/api/email?msgid=abcd1234plain&token=ABCD', 'email-plain.response')
register_uri('https://api.mailinator.com/api/email?msgid=1419696967-44152505-recipient&token=ABCD', 'email.response')
register_uri('https://api.mailinator.com/api/not-found?token=ABCD', 'not-found.response')
register_uri('https://api.mailinator.com/api/error?token=ABCD', 'error.response')
register_uri('https://api.mailinator.com/api/delete?msgid=abcd1234&token=ABCD', 'delete.response')
register_uri('https://api.mailinator.com/api/delete?msgid=1419696967-44152505-recipient&token=ABCD', 'delete.response')
register_uri('https://api.mailinator.com/api/inbox?private_domain=true&to=abcd1234&token=ABCD', 'inbox_private.response')
register_uri('https://api.mailinator.com/api/email?private_domain=true&msgid=1419696967-44152505-recipient&token=ABCD', 'email_private.response')

# NOTE: fix for travis ruby 1.9.3
#       it replaces https:// to http://:443
register_uri('http://api.mailinator.com:443/api/inbox?to=abcd1234&token=ABCD', 'inbox.response')
register_uri('http://api.mailinator.com:443/api/email?msgid=abcd1234&token=ABCD', 'email.response')
register_uri('http://api.mailinator.com:443/api/email?msgid=abcd1234plain&token=ABCD', 'email-plain.response')
register_uri('http://api.mailinator.com:443/api/email?msgid=1419696967-44152505-recipient&token=ABCD', 'email.response')
register_uri('http://api.mailinator.com:443/api/not-found?token=ABCD', 'not-found.response')
register_uri('http://api.mailinator.com:443/api/error?token=ABCD', 'error.response')
register_uri('http://api.mailinator.com:443/api/delete?msgid=abcd1234&token=ABCD', 'delete.response')
register_uri('http://api.mailinator.com:443/api/delete?msgid=1419696967-44152505-recipient&token=ABCD', 'delete.response')
register_uri('http://api.mailinator.com:443/api/inbox?private_domain=true&to=abcd1234&token=ABCD', 'inbox_private.response')
register_uri('http://api.mailinator.com:443/api/email?private_domain=true&msgid=1419696967-44152505-recipient&token=ABCD', 'email_private.response')
