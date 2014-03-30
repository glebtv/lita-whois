# lita-whois

WHOIS handler for searching domain, TLD, IPv4, and IPv6 WHOIS records.

## Installation

Add lita-whois to your Lita instance's Gemfile:

``` ruby
gem "lita-whois"
```

## Configuration

None

## Usage

Basics:
```
Lita whois example.com            - Get the WHOIS info for a domain
Lita whois .io                    - Get the WHOIS info for a TLD
Lita whois 8.8.8.8                - Get the WHOIS info for an IPv4 address
Lita whois 2001:418:141e:196::fc4 - Get the WHOIS info for an IPv6 address
```

## License

[MIT](http://opensource.org/licenses/MIT)
