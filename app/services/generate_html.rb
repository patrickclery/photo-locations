module Lendesk
  class GenerateHTML

    class << self
      def call(output_filename: 'image_gps_info.html', path: nil)
        File.open(output_filename, "wb") do |file|
          # Add each image as a row
          rows = []
          GetDirectoryImages.call(path).each do |image|
            rows << [
              image[:filename],
              image[:latitude],
              image[:longitude]
            ]
          end

          # Dump it all with Thamble
          puts Thamble.table(rows, headers: rows << %w( FILENAME LATITUDE LONGITUDE ))
        end
      end

    end

  end
end

