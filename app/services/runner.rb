module Lendesk
  class Runner

    class << self
      def call(directory: nil)
        Lendesk::GetDirectoryImages.call(directory).tap do |data|

        end
      end
    end

  end
end
