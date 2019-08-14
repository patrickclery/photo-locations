module Lendesk
  class Runner

    class << self
      def call(working_directory: nil)
        Lendesk::GetDirectoryImages.call(path: working_directory).tap do |data|

        end
      end
    end

  end
end
