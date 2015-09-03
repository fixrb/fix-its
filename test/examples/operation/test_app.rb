require_relative File.join '..', '..', 'support', 'coverage'
require_relative File.join '..', '..', '..', 'lib', 'fix', 'its'
require 'spectus'

@app = 1_040

t = Fix::Test.new @app do
  on :+, 1_040 do
    its(:itself) { MUST Equal: 2_080 }

    on(:+, 10) do
      its(:abs) { MUST Equal: 2_090 }

      on(:+, 10) do
        its(:to_i) { MUST_NOT Equal: 3_000 }
      end
    end
  end
end

Spectus.this { t.report.to_s }.MUST Eql:      \
  "\n"                                        \
  "\n"                                        \
  "\n"                                        \
  "Ran 3 tests in #{t.total_time} seconds\n"  \
  "100% compliant - 0 infos, 0 failures, 0 errors\n"

Spectus.this { t.pass? }.MUST :BeTrue
Spectus.this { t.fail? }.MUST :BeFalse
