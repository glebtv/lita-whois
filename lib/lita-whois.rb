require 'lita'

Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require 'lita/handlers/whois'

require 'ipaddress'
require 'whois'

Lita::Handlers::Whois.template_root File.expand_path(
  File.join('..', '..', 'templates'),
  __FILE__
)
