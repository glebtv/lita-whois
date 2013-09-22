require "lita"

module Lita
  module Handlers
    class Whois < Handler
        route(
        /^(wh|whois) (.+)/,
        :define,
        command: true,
        help: {
          "whois DOMAIN" => "Get the WHOIS info for a domain."
        }
        )
        
        def define(response)
          domain = response.matches[0][0]
          line = Cocaine::CommandLine.new("whois", domain)
          response.reply(line.run)
        end
    end

    Lita.register_handler(Whois)
  end
end
