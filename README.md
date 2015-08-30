# lita-whois

[![Build Status](https://img.shields.io/travis/glebtv/lita-whois/master.svg)](https://travis-ci.org/glebtv/lita-whois)
[![MIT License](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://tldrlegal.com/license/mit-license)
[![RubyGems](http://img.shields.io/gem/v/lita-whois.svg)](https://rubygems.org/gems/lita-whois)
[![Coveralls Coverage](https://img.shields.io/coveralls/glebtv/lita-whois/master.svg)](https://coveralls.io/r/glebtv/lita-whois)
[![Code Climate](https://img.shields.io/codeclimate/github/glebtv/lita-whois.svg)](https://codeclimate.com/github/glebtv/lita-whois)
[![Gemnasium](https://img.shields.io/gemnasium/glebtv/lita-whois.svg)](https://gemnasium.com/glebtv/lita-whois)

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
