# Fix::Its

[![Version](https://img.shields.io/github/v/tag/fixrb/fix-its?label=Version&logo=github)](https://github.com/fixrb/fix-its/tags)
[![Yard documentation](https://img.shields.io/badge/Yard-documentation-blue.svg?logo=github)](https://rubydoc.info/github/fixrb/fix-its/main)
[![License](https://img.shields.io/github/license/fixrb/fix-its?label=License&logo=github)](https://github.com/fixrb/fix-its/raw/main/LICENSE.md)

Fix::Its adds the word `its` to the language of [Fix](https://github.com/fixrb/fix): a method of the subject and one expectation about what it returns, on one line. `its(:size) { MUST eq 3 }` is `on(:size) { it MUST eq 3 }`, and the result points at the line of `its`.

## Installation

```ruby
# Gemfile
gem "fix-its"
```

Fix::Its requires Ruby 3.3 or later on a system with `fork`, and depends on [Fix](https://github.com/fixrb/fix).

## Usage

```ruby
# word_fix.rb
require "fix/its"

Fix :Word do
  its(:size) { MUST eq 5 }
  its(:upcase) { MUST eq "HELLO" }
  its(:start_with?, "he") { MUST be_true }

  on :chars do
    its(:first) { MUST eq "h" }
  end
end

exit(Fix[:Word].test { "hello" })
```

```text
word_fix.rb:5: Success: expected 5 to eq 5
word_fix.rb:6: Success: expected "HELLO" to eq "HELLO"
word_fix.rb:7: Success: expected true to be true
word_fix.rb:10: Success: expected "h" to eq "h"
```

`its` takes the name of the method and its arguments, as `on` does, and a block that gives the requirement: a level and a matcher, `MUST eq 5`. Inside an `on` or a `with`, `its` sends its method to the value of that context. Since `its` is a word of the language, a `let` cannot be named so.

The block is the context of the `on`, read once with the rest of the document: what else it does there is read as in an `on`, and its last expression is the requirement. A block that gives anything else, a bare matcher or an `it` of its own, raises `ArgumentError` at load, as does a missing block.

In Ruby 3.4 and later, a bare `it` in a block is the parameter of the block: `its(:size) { MUST eq it }` builds `eq nil`. On Ruby 3.3 that bare `it` is the word of Fix, which raises `ArgumentError` for want of a requirement. Write the value.

`its` takes no `location:`, which could not be told from a keyword argument of the method: a word that composes `its` in turn has its results pointing at its own call of `its`.

## Versioning

Fix::Its follows [Semantic Versioning 2.0](https://semver.org/).

## License

The [gem](https://rubygems.org/gems/fix-its) is available as open source under the terms of the [MIT License](https://github.com/fixrb/fix-its/raw/main/LICENSE.md).

## Sponsors

This project is sponsored by [Sashité](https://sashite.com/)
