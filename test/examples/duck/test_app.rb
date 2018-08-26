# frozen_string_literal: true

require_relative File.join '..', '..', 'support', 'coverage'
require_relative 'app'
require_relative File.join '..', '..', '..', 'lib', 'fix', 'its'
require 'spectus'

include Spectus

@bird = Duck.new

t = Fix::Test.new @bird do
  its(:swims) { MUST eql 'Swoosh...' }
  its(:speaks) { MUST raise_exception NoMethodError }
  its(:sings) { MAY eql '♪... ♫...' }
  its(:walks) { SHOULD eql 'Klop klop!' }
  its(:quacks) { SHOULD be_nil }
  its(:name) { MUST eql 'Donald Fauntleroy Duck' }
end

if defined?(RUBY_ENGINE) && RUBY_ENGINE == 'ruby' &&
   defined?(RUBY_VERSION) && RUBY_VERSION.start_with?('2.')

  it { t.report.to_s }.MUST eql                                               \
    "\n"                                                                      \
    "\n"                                                                      \
    "\e[33m1. Info: undefined method `sings' for #{@bird} (NoMethodError).\n" \
    "\e[0m\n"                                                                 \
    "\e[31m2. Error: undefined method `name' for #{@bird} (NoMethodError).\n" \
    "    #{t.report.test.results.last.backtrace.first}\n"                     \
    "\e[0m\n"                                                                 \
    "Ran 6 tests in #{t.total_time} seconds\n"                                \
    "\e[31m83% compliant - 1 infos, 0 failures, 1 errors\n"                   \
    "\e[0m"
end
