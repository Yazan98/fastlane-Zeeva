require 'fastlane/action'
require 'discordrb'
require_relative '../helper/zeeva_discord_helper'

module Fastlane
  module Actions
    class ZeevaDiscordAction < Action
      def self.run(params)
        serverToken = params[:server_token]
        applicationId = params[:client_id]
        channelId = params[:channel_id]
        buildName = params[:build_name]
        buildType = params[:build_type]
        platformCode = params[:platform_code]

        file_content = File.read('zeevaBuild.md');
        buildContent = file_content

        UI.message("Zeeva Fastlane Plugin - Discord Configuration - Started !!")
        UI.message("=========================== Bot Credentials ===========================")
        UI.message("Channel Id : " + channelId)
        UI.message("Application Id : " + applicationId)
        UI.message("Server Token : " + serverToken)
        UI.message("=======================================================================")
        run_application_bot(serverToken, applicationId, channelId, get_message_body(buildName, buildType, platformCode, buildContent))
      end

      def self.get_message_body(buildName, buildType, platform, buildContent)
        return "====== New Build ======" +
          "\n" +
          "Build Name : " +
          buildName + "\n" +
          "Build Type : " + buildType +
          "\n" + "Platform : " + platform + "\n" +
          "Build Content : " + buildContent +
          "\n" +
          "====== New Build ======"
      end

      def self.run_application_bot(token, appId, channelId, messageBody)
        bot = Discordrb::Bot.new token: token, client_id: appId
        bot.send_message(channelId, messageBody)

        # Enable this Line if you want to Stream the Connection
        # bot.run
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
          FastlaneCore::ConfigItem.new(
            key: :server_token,
            env_name: "SERVER_TOKEN",
            description: "The Private Current Server Token",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :client_id,
            env_name: "CLIENT_ID",
            description: "The Client ID for Your Bot",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :channel_id,
            env_name: "CHANNEL_ID",
            description: "The Target Channel ID The Bot Will Send the Message on",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :build_name,
            env_name: "BUILD_NAME",
            description: "The Build Name that Currently Running",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :build_type,
            env_name: "BUILD_TYPE",
            description: "The Build Type that Currently Running",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :platform_code,
            env_name: "PLATFORM_CODE",
            description: "The Platform that Currently Running Ex: Android, IOS, Mac",
            optional: false,
            type: String
          )
        ]
      end

      def self.is_supported?(platform)
        [:ios, :mac, :android].include?(platform)
        true
      end
    end
  end
end
