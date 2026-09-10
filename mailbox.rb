class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.4.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.4.0_darwin_arm64"
      sha256 "d5af43b93efe5d4b2021407dbb6a057143b324f465c8631746e295a58a59aa10"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.4.0_darwin_amd64"
      sha256 "cfe06ff0a9b1ba7d983b25ec3b52b8128bcd2eae3bc55f89ae91b71168e1a693"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.4.0_linux_arm64"
      sha256 "d616d7ccaa19a74a84ed0143d8b52154f04c5ed4d0d021ae2b3b1df46aa854c1"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.4.0_linux_amd64"
      sha256 "3e943350ca5f7854c2b28541f17a1cf918ece120c5f1ded9f0547005d12f0c6f"
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
