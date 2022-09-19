require 'fastlane/action'
require_relative '../helper/zeeva_discord_helper'

module Fastlane
  module Actions
    class ZeevaDiscordAction < Action
      def self.run(params)
        UI.message("The zeeva_discord plugin is working!")
      end

      def self.description
        "Fastlane Plugin to Send Messages about Builds from Android, IOS Applications Via Fastlane"
      end

      def self.authors
        ["Yazan Tarifi"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "Fastlane Plugin To Send Messages on Channels in Discord Private Server to Notify the Team once New Build Sent and You can Provide Custom Messages, Titles and Message Content With Json File Configuration and This Task Will be Started once you Push new Build from Your Mobile Application via Fastlane Task"
      end

      def self.available_options
        [
          # FastlaneCore::ConfigItem.new(key: :your_option,
          #                         env_name: "ZEEVA_DISCORD_YOUR_OPTION",
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
