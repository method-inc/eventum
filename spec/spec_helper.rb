require "rspec"
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    # Use only the expect syntax
    expectations.syntax = :expect

    # Include custom matcher descriptions in output
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents from mocking a method that does not exist on a real object
    mocks.verify_partial_doubles = true
  end

  # Limits the available syntax to the non-monkey patched syntax
  config.disable_monkey_patching!
  config.expose_dsl_globally = false

  # Allow more verbose output when running an individual spec file
  if config.files_to_run.one?
    # Use the documentation formatter for detailed output
    config.default_formatter = "doc"
  end

  # Run specs in random order to surface order dependencies
  config.order = :random

  # Seed global randomization in this process using the `--seed` CLI option
  Kernel.srand config.seed
end

require "vcr"
VCR.configure do |config|
  config.cassette_library_dir = "spec/cassettes"
  config.hook_into :webmock
end

require "simplecov"
require "coveralls"
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

SimpleCov.start do
  add_filter "/spec/"
  minimum_coverage(90)
end

require "eventum"
