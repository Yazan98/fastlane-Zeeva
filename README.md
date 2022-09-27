# Zeeva

Fastlane Plugins to Send Build Messages Configured with Discord, Telegram Bots
This Repository has 2 Plugins (Telegram, Discord)

## Screenshots

### Discord

![](https://user-images.githubusercontent.com/29167110/192423750-65d714de-7cc5-428c-9052-8b8d250696b1.png)


### Telegram

![](https://user-images.githubusercontent.com/29167110/192424255-4362aeec-26a8-45d9-8754-2494c2b7fcc1.jpeg)

## Links

[Discord Plugin](https://rubygems.org/gems/fastlane-plugin-zeeva_discord)

[Telegram Plugin](https://rubygems.org/gems/fastlane-plugin-zeeva_telegram)

## Installation

1. Discord Plugin
```
Gemfile : gem 'discordrb'
Pluginfile : gem 'fastlane-plugin-zeeva_discord'

Fastfile:

lane :test do
    zeeva_discord(
      server_token: "Server Token",
      client_id: "Bot Client ID",
      channel_id: "Target Channel ID",
      build_name: "Android Production Build",
      platform_code: "Android",
      build_type: "Debuggable Build"
    )
  end
```

2. Telegram Plugin
```
Pluginfile : gem 'fastlane-plugin-zeeva_telegram'

Fastfile:
lane :test2 do
    zeeva_telegram(
      server_token: "Bot Token",
      build_name: "Android Production Build",
      platform_code: "Android",
      build_type: "Debuggable Build",
      title: "Title Here",
      message: "Message Here",
      chat_id: "Channel ID"
    )
  end
```

## Build Notes

If you want to Send Build Notes with Current Lane, You need to Create (zeevaBuild.md)
and Add Release Notes to this File (The Plugin will take the Build Notes and Add them to message)

