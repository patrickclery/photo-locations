module Lendesk
  class Runner

    class << self
      def call(output_filename: 'image_gps_info.csv', path: nil)

        CSV.open(output_filename, "wb") do |csv|
          csv << %w( FILENAME LATITUDE LONGITUDE )

          # Add each image as a row
          GetDirectoryImages.call(path).each do |image|
            csv << [
              image[:filename],
              image[:latitude],
              image[:longitude]
            ]
          end
        end
      end

    end

  end
end
