require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'fix', 'its'
require 'spectus'

@app = 1_040

t = Fix::Test.new @app, verbose: false do
  on :+, 1_040 do
    its(:to_i) { MUST Equal: 2_080 }

    on(:+, 10) do
      its(:abs) { MUST Equal: 2_090 }

      on(:+, 10) do
        its(:to_i) { MUST_NOT Equal: 3_000 }
      end
    end
  end
end

Spectus.this { t.report.to_s }.MUST Eql:                    \
  "Ran 3 tests in #{t.total_time} seconds\n"                \
  "\e[32m100% compliant - 0 infos, 0 failures, 0 errors\n"  \
  "\e[0m"

Spectus.this { t.pass? }.MUST :BeTrue
Spectus.this { t.fail? }.MUST :BeFalse
