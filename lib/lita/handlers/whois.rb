module Lita
  module Handlers
    class Whois < Handler
      route(
        /^whois\s(?<input>.*)$/,
        :whois,
        help: {
          'whois example.com' => 'Get the WHOIS info for a domain',
          'whois .io' => 'Get the WHOIS info for a TLD',
          'whois 8.8.8.8' => 'Get the WHOIS info for an IPv4 or IPv6 address'
        }
      )

      def whois(response)
        input = response.match_data['input']
        response.reply(render_template('full', output: lookup(input)))
      end

      private

      def lookup(record)
        client = ::Whois::Client.new
        client.lookup(record).to_s
      rescue => e
        log.warn e
        render_template('simple', output: "Error looking up WHOIS data for #{record}")
      end
    end

    Lita.register_handler(Whois)
  end
end
