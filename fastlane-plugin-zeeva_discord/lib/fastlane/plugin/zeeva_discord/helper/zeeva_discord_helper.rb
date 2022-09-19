require 'fastlane_core/ui/ui'

module Fastlane
  UI = FastlaneCore::UI unless Fastlane.const_defined?("UI")

  module Helper
    class ZeevaDiscordHelper
      # class methods that you define here become available in your action
      # as `Helper::ZeevaDiscordHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the zeeva_discord plugin helper!")
      end
    end
  end
end
