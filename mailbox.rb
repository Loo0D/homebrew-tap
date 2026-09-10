class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.2.0_darwin_arm64"
      sha256 "28da314a67185b0369e953d78337b10fe2cda34f5726f3dfd23a7db4139b8130"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.2.0_darwin_amd64"
      sha256 "4c92dd1a4eb476f738c736a79cca6f61e6287182b22d0d9f30995f78e3b449a4"
    end
  end

  on_linux do
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.2.0_linux_amd64"
      sha256 "4145caf9691c62a2f6da9c11d3e479add7baf082351022d4bf5218a9c47b02a5"
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
