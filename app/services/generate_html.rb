module Lendesk
  class GenerateHTML

    class << self
      def call(output_file:, target_directory:)
        File.open(output_file, "wb") do |file|
          # Add each image as a row
          rows = []
          GetDirectoryImages.call(target_directory).each do |image|
            rows << [
              image[:filename],
              image[:latitude],
              image[:longitude]
            ]
          end

          # Dump it all with Thamble
          file.write Thamble.table(rows, headers: %w( FILENAME LATITUDE LONGITUDE ))
        end
      end

    end

  end
end

