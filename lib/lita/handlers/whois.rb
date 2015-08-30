module Lita
  module Handlers
    class Whois < Handler
      route(
        /^whois\s(\w+).(\w+)$/,
        :whois_domain,
        help: {
          'whois example.com' => 'Get the WHOIS info for a domain'
        }
      )

      route(
        /^whois\s.(\w+)$/,
        :whois_tld,
        help: {
          'whois .io' => 'Get the WHOIS info for a TLD'
        }
      )

      route(
        /^whois\s(.+)$/,
        :whois_ip,
        help: {
          'whois 8.8.8.8' => 'Get the WHOIS info for an IPv4 or IPv6 address'
        }
      )

      def whois_domain(response)
        response.reply(lookup("#{response.matches[0][0]}." \
                              "#{response.matches[0][1]}"))
      end

      def whois_tld(response)
        response.reply(lookup(".#{response.matches[0][0]}"))
      end

      def whois_ip(response)
        return unless IPAddress.valid? response.matches[0][0]
        response.reply(reverse_lookup(response.matches[0][0]))
      end

      private

      def lookup(domain)
        client = ::Whois::Client.new
        record = nil
        begin
          record = client.lookup(domain)
        rescue ::Whois::ServerNotFound
          return "Cannot find a WHOIS server for #{domain}"
        end

        record.to_s
      end

      def reverse_lookup(ip)
        client = ::Whois::Client.new
        record = nil
        begin
          record = client.lookup(ip)
        rescue ::Whois::AllocationUnknown, ::Whois::ServerNotFound,
               ::Whois::NoInterfaceError
          return "Cannot find a WHOIS server for #{ip}"
        end

        record.to_s
      end
    end

    Lita.register_handler(Whois)
  end
end
