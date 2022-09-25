require 'fastlane/action'
require_relative '../helper/zeeva_telegram_helper'

module Fastlane
  module Actions
    class ZeevaTelegramAction < Action
      def self.run(params)
        UI.message("The zeeva_telegram plugin is working!")
      end

      def self.description
        "Telegram Bot Plugin to Send Build Messages for Android, IOS"
      end

      def self.authors
        ["Yazan Tarifi"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Another Bot to Send Messages on Telegram Bot Based on Builds Sent for Android, IOS"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "ZEEVA_TELEGRAM_YOUR_OPTION",
          #                      description: "A description of your option",
          #                         optional: false,
          #                             type: String)
        ]
      end

      def self.is_supported?(platform)
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://docs.fastlane.tools/advanced/#control-configuration-by-lane-and-by-platform
        #
        # [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
