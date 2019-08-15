module Lendesk
  class ImageDirectoryScanner
    class << self

      def call(target_directory:, format:, output_file:)

        generator = format == :html ? GenerateHTML : GenerateCSV
        generator.call(target_directory: target_directory, output_file: output_file)

      end
    end
  end
end
