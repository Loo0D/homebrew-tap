class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.3_darwin_arm64"
      sha256 "6a56eb7aa94b71e38107e3ea1a0783ddaaa90b9a9cb1180339baf1512214a246"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.3_darwin_amd64"
      sha256 "7946d01b02199d9aff8c93cbb79f27e50b7c4348c95a36b353253e64f375e68d"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.3_linux_arm64"
      sha256 "aed4369106ad28fbf526c8ebd3a3944b9a16803d198fac308d4708edcb553cd9"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.3_linux_amd64"
      sha256 "5c4852873f40b37287a4d09b231dbca7dddbc0fbad1629c3a9b456e20cb7fc5d"
    end
  end

  def install
    os_part = OS.mac? ? "darwin" : "linux"
    arch_part = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "mailbox_#{version}_#{os_part}_#{arch_part}" => "mailbox"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/mailbox --version")
  end
end
