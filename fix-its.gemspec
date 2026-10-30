# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name                   = "fix-its"
  spec.version                = File.read(File.join(__dir__, "VERSION.semver")).chomp
  spec.author                 = "Cyril Kato"
  spec.email                  = "contact@cyril.email"
  spec.summary                = "The word its for Fix: a method of the subject and its expectation on one line"
  spec.description            = "Fix::Its adds the word its to the language of Fix: a method of the subject and one " \
                                "expectation about what it returns, on one line. its(:size) { MUST eq 3 } is " \
                                "on(:size) { it MUST eq 3 }, and the result points at the line of its."
  spec.homepage               = "https://fixrb.dev/gems/fix-its/"
  spec.license                = "MIT"
  spec.files                  = Dir["LICENSE.md", "README.md", "lib/**/*.rb", base: __dir__]
  spec.required_ruby_version  = ">= 3.3.0"

  spec.metadata["bug_tracker_uri"]       = "https://github.com/fixrb/fix-its/issues"
  spec.metadata["documentation_uri"]     = "https://rubydoc.info/gems/fix-its"
  spec.metadata["rubygems_mfa_required"] = "true"
  spec.metadata["source_code_uri"]       = "https://github.com/fixrb/fix-its"

  spec.add_dependency "fix", "~> 1.0"
end
