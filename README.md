# Zeeva
Fastlane Plugins to Send Messages on (Discord, Telegram, Slack) Could be Used to Send Messages When New Build Generated for Android, IOS Applications

Discord Link: https://rubygems.org/gems/fastlane-plugin-zeeva_discord

Example

```
lane :test do
  zeeva_discord(
    server_token: "",
    client_id: "",
    channel_id: "",
    build_name: "Android Production Build",
    platform_code: "Android",
    build_type: "Debuggable Build"
  )
end
```

Plugin File:

```
gem 'fastlane-plugin-zeeva_discord'
```
