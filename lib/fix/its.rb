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
    #   its(:abs) { MUST Equal: 42 }
    #
    # @param method_name [Symbol] The identifier of a method.
    # @param spec        [Proc]   A spec to compare against the computed value.
    #
    # @return [Array] List of results.
    def its(method_name, &spec)
      challenges = @challenges + [Defi.send(method_name)]

      i = It.new(@front_object, challenges, @helpers.dup)

      result = begin
                 i.instance_eval(&spec)
               rescue Spectus::Result::Fail => f
                 f
               end

      if @configuration.fetch(:verbose, true)
        print result.to_char(@configuration.fetch(:color, false))
      end

      results << result
    end
  end
end
