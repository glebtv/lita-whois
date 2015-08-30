require 'spec_helper'

describe Lita::Handlers::Whois, lita_handler: true do
  it do
    is_expected.to route_command('whois example.com').to(:whois)
    is_expected.to route_command('whois .io').to(:whois)
    is_expected.to route_command('whois 8.8.8.8').to(:whois)
    is_expected.to route_command('whois 2001:418:141e:196::fc4').to(:whois)
  end

  describe '#whois_domain' do
    let(:domain_good) do
      client = double
      expect(client).to receive(:lookup) { 'Generic response example.com' }
      client
    end

    let(:domain_bad) do
      client = double
      expect(client).to receive(:lookup) { 'Bad domain asdfasfldjf.com' }
      client
    end

    let(:domain_err) do
      client = double
      expect(client).to receive(:lookup).and_raise(Whois::ServerNotFound)
      client
    end

    it 'shows a record when the domain exists' do
      expect(Whois::Client).to receive(:new) { domain_good }
      send_command('whois example.com')
      expect(replies.last).to eq('Generic response example.com')
    end

    it 'shows an error when the domain is not registered' do
      expect(Whois::Client).to receive(:new) { domain_bad }
      send_command('whois asdfasfldjf.com')
      expect(replies.last).to eq('Bad domain asdfasfldjf.com')
    end

    it 'shows an error when the domain does not have a WHOIS' do
      expect(Whois::Client).to receive(:new) { domain_err }
      send_command('whois asdf.sdf')
      expect(replies.last).to eq('Error looking up WHOIS data for asdf.sdf')
    end
  end

  describe '#whois_tld' do
    let(:tld_good) do
      client = double
      expect(client).to receive(:lookup) { 'Generic TLD response .io' }
      client
    end

    let(:tld_bad) do
      client = double
      expect(client).to receive(:lookup) { 'Invalid TLD response .wtf' }
      client
    end

    it 'shows a record when the tld exists' do
      expect(Whois::Client).to receive(:new) { tld_good }
      send_command('whois .io')
      expect(replies.last).to eq('Generic TLD response .io')
    end

    it 'shows an error when the tld does not exist' do
      expect(Whois::Client).to receive(:new) { tld_bad }
      send_command('whois .wtf')
      expect(replies.last).to eq('Invalid TLD response .wtf')
    end
  end

  describe '#whois_ipv4' do
    let(:ipv4_good) do
      client = double
      expect(client).to receive(:lookup) { 'Generic IPv4 response 8.8.8.8' }
      client
    end

    let(:ipv4_err) do
      client = double
      expect(client).to receive(:lookup).and_raise(Whois::ServerNotFound)
      client
    end

    let(:ipv6_good) do
      client = double
      expect(client).to receive(:lookup) { 'IPv6 resp 2001:418:141e:196::fc4' }
      client
    end

    let(:ipv6_err) do
      client = double
      expect(client).to receive(:lookup).and_raise(Whois::ServerNotFound)
      client
    end

    it 'shows results for the IPv4 address' do
      expect(Whois::Client).to receive(:new) { ipv4_good }
      send_command('whois 8.8.8.8')
      expect(replies.last).to eq('Generic IPv4 response 8.8.8.8')
    end

    it 'shows an error when the IP is invalid' do
      expect(Whois::Client).to receive(:new) { ipv4_err }
      send_command('whois 0.0.0.0')
      expect(replies.last).to eq('Error looking up WHOIS data for 0.0.0.0')
    end

    it 'shows results for the IPv6 address' do
      expect(Whois::Client).to receive(:new) { ipv6_good }
      send_command('whois 2001:418:141e:196::fc4')
      expect(replies.last).to eq('IPv6 resp 2001:418:141e:196::fc4')
    end

    it 'shows an error when the IP is invalid' do
      expect(Whois::Client).to receive(:new) { ipv6_err }
      send_command('whois ::')
      expect(replies.last).to eq('Error looking up WHOIS data for ::')
    end
  end
end
