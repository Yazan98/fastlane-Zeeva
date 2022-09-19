describe Fastlane::Actions::ZeevaDiscordAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The zeeva_discord plugin is working!")

      Fastlane::Actions::ZeevaDiscordAction.run(nil)
    end
  end
end
