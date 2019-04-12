# Fix::Its

[![Build Status](https://travis-ci.org/fixrb/fix-its.svg?branch=master)][travis]
[![Code Climate](https://codeclimate.com/github/fixrb/fix-its/badges/gpa.svg)][codeclimate]
[![Gem Version](https://badge.fury.io/rb/fix-its.svg)][gem]
[![Inline docs](http://inch-ci.org/github/fixrb/fix-its.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

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

Add this line to your application's Gemfile:

```ruby
gem 'fix-its'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fix-its

## Let's get started!

[![asciicast](https://asciinema.org/a/25973.png)](https://asciinema.org/a/25973)

## Usage

Given this code:

```ruby
require 'fix/its'

Fix.describe -6 * 7 do
  its(:abs) { MUST equal 42 }
end
```

The output should look like this:

    $ ruby answer_spec.rb
    .

    Ran 1 tests in 0.000164 seconds
    100% compliant - 0 infos, 0 failures, 0 errors

## Security

As a basic form of security __Fix::Its__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/fix-its-0.1.0.gem
    26198b7812a5ac118a5f2a1b63927871b3378efb071b37abb7e1ba87c1aac9f3a6b45eeae87d9dc647b194c15171b13f15e46503a9a1440b1233faf924381ff5  pkg/fix-its-0.1.0.gem

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
[codeclimate]: https://codeclimate.com/github/fixrb/fix-its
[gemnasium]: https://gemnasium.com/fixrb/fix-its
[inchpages]: http://inch-ci.org/github/fixrb/fix-its
[rubydoc]: http://rubydoc.info/gems/fix-its/frames

***

This project is sponsored by:

[![Sashite](https://sashite.com/img/sashite.png)](https://sashite.com/)
