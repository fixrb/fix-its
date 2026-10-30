# frozen_string_literal: true

require "fix"

# The specifications of Fix: this gem adds the word `its` to their language.
module Fix
  # The word `its`, added to the language of a specification: a method of
  # the subject and one expectation about what it returns, on one line.
  # `its(:size) { MUST eq 3 }` is `on(:size) { it MUST eq 3 }`, the result
  # pointing at the line of `its`.
  module Its
    # @param name [Symbol] the method, followed by its positional and keyword
    #   arguments, as for `on`
    # @yieldreturn [Spectus::Requirement] the requirement, `MUST eq(3)` say
    # @return [nil]
    # @raise [ArgumentError] when the name is not a Symbol, without a block,
    #   or when the block does not give a requirement
    def its(name, *, **, &block)
      raise ::ArgumentError, "a block must be given" unless block

      location = caller_locations(1, 1).fetch(0)
      on(name, *, **) do
        requirement = instance_exec(&block)
        unless ::Spectus::Requirement === requirement
          raise ::ArgumentError, "the block of its gives a requirement: its(:size) { MUST eq(3) }"
        end

        it(requirement, location:)
      end
    end
  end

  # The language of a specification, with the word `its` among its words.
  class Dsl
    include Its
  end
end
