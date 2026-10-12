class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.2_darwin_arm64"
      sha256 "bb45ab1f6e12328992a3f13e9446bf03e294bc571896f202291e2e23783c370d"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.2_darwin_amd64"
      sha256 "3c9dd5a5b640085d4bc507871ddd387f287a52e42869ad941710083f6caed0a3"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.2_linux_arm64"
      sha256 "16bd4ad9c85da60ef9bc5ff6bfcfe966562757afd78afb78564314269bb22914"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.2_linux_amd64"
      sha256 "081118d7bc21053a57303f20721ac5e189ab9c064ed5b3d4ecace9e90c1ddbfd"
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
