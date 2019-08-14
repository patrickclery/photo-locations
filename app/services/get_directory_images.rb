require 'exifr'

module Lendesk
  class GetDirectoryImages

    class << self
      # @param path The diretory (default: current working dir)
      # @param format What format to return it in (default: CSV)
      def call(path: nil, format: :csv)
        path ||= Dir.pwd
        Dir.glob("#{path}/**/*.jpg").map do |filename|
          extract_image_info(filename)
        end
      end

      private

      def extract_image_info(filename)
        EXIFR::JPEG.new(filename).tap do |info|
          return {
            filename:  filename,
            latitude:  info.gps.latitude,
            longitude: info.gps.longitude
          }
        end
      end
    end

  end
end
