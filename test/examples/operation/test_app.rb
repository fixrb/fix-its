# frozen_string_literal: true

require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'fix', 'its'
require 'spectus'

include Spectus

@app = 1_040

t = Fix::Test.new @app, verbose: false do
  on :+, 1_040 do
    its(:to_i) { MUST equal 2_080 }

    on(:+, 10) do
      its(:abs) { MUST equal 2_090 }

      on(:+, 10) do
        its(:to_i) { MUST_NOT equal 3_000 }
      end
    end
  end
end

it { t.report.to_s }.MUST eql                               \
  "Ran 3 tests in #{t.total_time} seconds\n"                \
  "\e[32m100% compliant - 0 infos, 0 failures, 0 errors\n"  \
  "\e[0m"

it { t.pass? }.MUST be_true
it { t.fail? }.MUST be_false
