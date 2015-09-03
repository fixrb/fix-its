# Fix

[![Build Status](https://travis-ci.org/fixrb/fix-its.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/fix-its.svg)][gem]
[![Inline docs](http://inch-ci.org/github/fixrb/fix-its.svg?branch=master)][inchpages]

> Provides `its` method for attribute matching.

## Contact

* Home page: https://github.com/fixrb/fix-its
* Bugs/issues: https://github.com/fixrb/fix-its/issues
* Support: https://stackoverflow.com/questions/tagged/fixrb

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](http://rubini.us/)
* [JRuby](http://jruby.org/)

## Installation

__Fix::Its__ is cryptographically signed.

To be sure the gem you install hasn't been tampered with, add my public key (if you haven't already) as a trusted certificate:

    $ gem cert --add <(curl -Ls https://raw.github.com/fixrb/fix-its/master/certs/gem-fixrb-public_cert.pem)
    $ gem install fix-its -P HighSecurity

The `HighSecurity` trust profile will verify all gems.  All of __Fix::Its__'s dependencies are signed.

Or add this line to your application's Gemfile:

```ruby
gem 'fix-its'
```

And then execute:

    $ bundle

## Usage

Given this code:

```ruby
require 'fix/its'

Fix.describe -6 * 7 do
  its(:abs) { MUST Equal: 42 }
end
```

The output should look like this:

    $ ruby answer_spec.rb
    .

    Ran 1 tests in 0.00038 seconds
    100% compliant - 0 infos, 0 failures, 0 errors

## Security

As a basic form of security __Fix::Its__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/fix-its-0.1.0.gem
    d12d7d9c2a4fdfe075cbb7a141fa5f2195175891e4098c7e1a28c8bca655ab44fb9d67b6a2e3991d0f852026c5e4537fdf7e314575c68d1c80b3a4b1eb1c041f  pkg/fix-its-0.1.0.gem

## Versioning

__Fix::Its__ follows [Semantic Versioning 2.0](http://semver.org/).

## Contributing

1. [Fork it](https://github.com/fixrb/fix-its/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.

[gem]: https://rubygems.org/gems/fix-its
[travis]: https://travis-ci.org/fixrb/fix-its
[inchpages]: http://inch-ci.org/github/fixrb/fix-its/
