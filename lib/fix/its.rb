require 'fix'

# Namespace for the Fix framework.
#
# @api public
#
module Fix
  # Its's helper.
  #
  # @api private
  #
  module Its
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
      i = It.new do
        Sandbox.new(@front_object,
                    *@challenges, Spectus::Challenge.new(method_name)).actual
      end

      result = begin
                 i.instance_eval(&spec)
               rescue Spectus::Result::Fail => f
                 f
               end

      print result.to_char
      results << result
    end
  end

  # Include the content of the Its module in to On class.
  #
  # @api private
  #
  class On
    include Its
  end
end
