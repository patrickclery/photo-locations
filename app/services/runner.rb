module Lendesk
  class Runner

    class << self
      def call(output_filename:, working_directory: nil)

        CSV.open(output_filename, "wb") do |csv|
          csv << %w( FILENAME LATITUDE LONGITUDE )

          # Add each image as a row
          GetDirectoryImages.call(path: working_directory).each do |image|
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
