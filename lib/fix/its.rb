# frozen_string_literal: true

require 'fix'

# Namespace for the Fix framework.
#
# @api public
#
module Fix
  # Open the on class.
  #
  # @api private
  #
  class On
    # Add its method to the DSL.
    #
    # @api public
    #
    # @example Its absolute value must equal 42
    #   its(:abs) { MUST equal 42 }
    #
    # @param method [Symbol] The identifier of a method.
    # @param spec   [Proc]   A spec to compare against the computed value.
    #
    # @return [Array] List of results.
    #
    # rubocop:disable AbcSize
    def its(method, &spec)
      i = It.new(described, (challenges + [Defi.send(method)]), helpers.dup)

      result = i.verify(&spec)

      if configuration.fetch(:verbose, true)
        print result.to_char(configuration.fetch(:color, false))
      end

      results << result
    end
    # rubocop:enable AbcSize
  end
end
