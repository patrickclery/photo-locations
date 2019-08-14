module Lendesk
  class GetDirectoryImages

    class << self
      # @param path The diretory (default: current working dir)
      # @param format What format to return it in (default: CSV)
      def call(path: nil, format: :csv)
        path ||= Dir.pwd
        Dir.glob("#{path}/**/*.jpg")
      end
    end

  end
end
