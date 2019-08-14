require "bundler/setup"

require "./app/lendesk"

require 'contexts/stub_filenames_and_images'
require 'examples/examples_for_file_generators'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
