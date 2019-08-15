module Lendesk
  class ImageDirectoryScanner
    class << self

      def start

        options = {}
        OptionParser.new do |opts|
          opts.banner = "Usage: application.rb [options]"
#   As a bonus, output either CSV or HTML, based on a parameter passed in via the command line.
          opts.on("--html", "Output in HTML format (default is CSV)") do
            options[:format] = :html
          end
          opts.on("-o FILE", "--output-file=FILE", String, "File to output to. (Default: 'image_gps_info.{csv,html}')") do |output_file|
            options[:output_file] = output_file
          end
          opts.on("-d DIR", "--target-directory=DIR", "Target directory to scan for JPG files. (Default: current directory)") do |target_directory|
            options[:target_directory] = output_file
          end
          opts.on("-h", "--help", "Prints this help") do
            puts opts
            exit
          end
        end.parse

        options[:target_directory] ||= Dir.pwd
        options[:format]           ||= :csv
        options[:output_file]      ||= 'image_gps_info.' + (options[:format] == :csv ? 'csv' : 'html')

        call(**options)
      end

      def call(target_directory:, format:, output_file:)

        generator = format == :html ? GenerateHTML : GenerateCSV
        generator.call(target_directory: target_directory, output_file: output_file)

      end
    end
  end
end
