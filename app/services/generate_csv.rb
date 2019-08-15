module Lendesk
  class GenerateCSV

    class << self
      def call(output_file:, target_directory:)
        CSV.open(output_file, "wb") do |csv|
          csv << %w( FILENAME LATITUDE LONGITUDE )

          # Add each image as a row
          GetDirectoryImages.call(target_directory).each do |image|
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
