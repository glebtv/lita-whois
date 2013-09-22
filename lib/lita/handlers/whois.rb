require "lita"

module Lita
  module Handlers
    class Whois < Handler
        route(/^whois\s+(.+)/, :whois, help: {"whois DOMAIN" => "Get the WHOIS info for a domain."})
        
        def whois(response)
          domain = response.match_data[1]
          line = ::Cocaine::CommandLine.new("whois", ':domain')
          response.reply(line.run(domain: domain))
        end
    end

    Lita.register_handler(Whois)
  end
end
