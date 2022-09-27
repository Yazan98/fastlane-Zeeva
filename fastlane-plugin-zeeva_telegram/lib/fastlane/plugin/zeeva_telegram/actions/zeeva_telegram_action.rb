require 'fastlane/action'
require 'net/http'
require_relative '../helper/zeeva_telegram_helper'

module Fastlane
  module Actions
    class ZeevaTelegramAction < Action
      def self.run(params)
        serverToken = params[:server_token]
        buildName = params[:build_name]
        buildType = params[:build_type]
        platformCode = params[:platform_code]
        chatId = params[:chat_id]
        title = params[:title]
        message = params[:message]

        buildContent = ""

        begin
          File.open 'zeevaBuild.md' do |f|
            file_content = File.read('zeevaBuild.md');
            buildContent = file_content
          end
        rescue Errno::ENOENT => e
          $stderr.puts "Caught the exception: #{e}"
        end

        UI.message("Zeeva Fastlane Plugin - Discord Configuration - Started !!")
        UI.message("=========================== Bot Credentials ===========================")
        UI.message("Server Token : " + serverToken)
        UI.message("Server Chat Id : " + chatId)
        UI.message("=======================================================================")
        run_application_bot(serverToken, chatId, get_message_body(
          buildName,
          buildType,
          platformCode,
          buildContent,
          title,
          message
        ))
      end

      def self.run_application_bot(token, chatId, messageBody)
        Net::HTTP.get(URI.parse('https://api.telegram.org/bot' + token + '/sendMessage?chat_id=' + chatId + '&text=' + messageBody))
      end

      def self.get_message_body(buildName, buildType, platform, buildContent, title, messageContent)
        message = "====== New Build ====== %0A"
        message += "Build Name : " + buildName + " %0A"
        message += "Build Type : " + buildType + " %0A"
        message += "Build Platform : " + platform + " %0A"
        if buildContent.length != 0
          message += "Build Content : " + " %0A"
          message += buildContent + " %0A"
        end

        if title.length != 0
          message += "Title : " + title + " %0A"
        end

        if messageContent.length != 0
          message += "Message : " + messageContent + " %0A"
        end

        message += "====== New Build ======"
        return message
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
          FastlaneCore::ConfigItem.new(
            key: :server_token,
            env_name: "SERVER_TOKEN",
            description: "The Private Current Server Token",
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
          ),
          FastlaneCore::ConfigItem.new(
            key: :title,
            env_name: "TITLE",
            description: "The Title of the Build",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :message,
            env_name: "MESSAGE",
            description: "The Message Body of the Build",
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :chat_id,
            env_name: "CHAT_ID",
            description: "The Chat Id of the Message",
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
