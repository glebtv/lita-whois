module Lita
  module Handlers
    class Whois < Handler
      route(
        /^whois\s(?<input>.*)$/,
        :whois,
        help: {
          t('help.syntax.domain') => t('help.desc.domain'),
          t('help.syntax.tld') => t('help.desc.tld'),
          t('help.syntax.ip') => t('help.desc.ip')
        }
      )

      def whois(response)
        input = response.match_data['input']
        response.reply(lookup(input))
      end

      private

      def lookup(record)
        client = ::Whois::Client.new
        render_template('full', output: client.lookup(record).to_s)
      rescue => e
        log.warn e
        render_template('simple', output: t('error', record: record))
      end
    end

    Lita.register_handler(Whois)
  end
end
