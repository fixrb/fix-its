# frozen_string_literal: true

require_relative File.join("support", "coverage")
require_relative File.join("..", "lib", "fix", "its")
require_relative File.join("support", "helpers")

# its(:name) { MUST eq 1 } is on(:name) { it MUST eq 1 }, the expectation at
# the line of its, with the arguments of the method as for on.
line = __LINE__
spec = Fix.spec do
  its(:size) { MUST eq 3 }
  its(:fetch, 1) { MUST eq 2 }
  its(:fetch, 9) { MUST raise_exception IndexError }
  its(:sum, 1) { SHOULD_NOT eq 7 }
  on(:first) { its(:to_s) { MUST eq "1" } }
  with(name: 1) { its(:size) { MAY eq 4 } }
end
chains = ["", ".size", ".fetch(1)", ".fetch(9)", ".sum(1)", ".first", ".first.to_s", "", ".size"]
raise unless spec.nodes.map(&:chain) == chains
raise unless Fix.spec { its(:fetch, 1, default: 2) { MUST eq 1 } }.nodes.last.chain == ".fetch(1, default: 2)"
locations = [2, 3, 4, 5, 6, 7].map { |offset| "test/test_its.rb:#{line + offset}" }
raise unless spec.nodes.flat_map(&:expectations).map(&:location) == locations
raise unless spec.nodes.flat_map(&:expectations).map { |e| e.requirement.level } == %i[MUST MUST MUST SHOULD MUST MAY]
raise unless spec.run { [1, 2, 3] }.map(&:outcome) == %i[success success success warning success failure]
raise unless spec.run { [1, 2, 3] }.map(&:summary).first(2) == ["expected 3 to eq 3", "expected 2 to eq 2"]
passed, output = printed { Fix.spec { its(:size) { MUST eq 1 } }.test { "ab" } }
raise unless passed.equal?(false) && output == "test/test_its.rb:#{__LINE__ - 1}: Failure: expected 2 to eq 1\n"

# The block gives a requirement, and is required; the name is a Symbol.
error = raised { Fix.spec { its(:size) } }
raise unless error.instance_of?(ArgumentError) && error.message == "a block must be given"
error = raised { Fix.spec { its(:size) { eq 1 } } }
raise unless error.instance_of?(ArgumentError)
raise unless error.message == "the block of its gives a requirement: its(:size) { MUST eq(3) }"
error = raised { Fix.spec { its(:size) { it MUST eq 1 } } }
raise unless error.instance_of?(ArgumentError)
raise unless error.message == "the block of its gives a requirement: its(:size) { MUST eq(3) }"
error = raised { Fix.spec { its("size") { MUST eq 1 } } }
raise unless error.instance_of?(ArgumentError) && error.message == "the name of the method must be a Symbol"

# its is a word of the language: a let cannot take its name.
error = raised { Fix.spec { let(:its) { 1 } } }
raise unless error.instance_of?(ArgumentError) && error.message == "its is already a method of Fix::Its"
raise unless Fix::Dsl.public_instance_methods(false).sort == %i[it let nodes on with]
raise unless Fix::Its.public_instance_methods(false) == [:its]
raise unless Fix::Dsl.include?(Fix::Its)
