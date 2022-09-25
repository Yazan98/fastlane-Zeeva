describe Fastlane::Actions::ZeevaTelegramAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The zeeva_telegram plugin is working!")

      Fastlane::Actions::ZeevaTelegramAction.run(nil)
    end
  end
end
