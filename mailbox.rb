class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.5.0_darwin_arm64"
      sha256 "391ef7c6b253ddc884768d7e2322806cc1133b2aa01dc24fef996ff153aa597f"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.5.0_darwin_amd64"
      sha256 "31c680f04c1284128256332bfbbdffb65874feb2ff2b34edd6672a29838309a6"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.5.0_linux_arm64"
      sha256 "cb75b142630bf7b3128f3345f56eff7b0832e8e97cb0e86b07a44a06667b8b48"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.5.0_linux_amd64"
      sha256 "146fb1e2ef2a9b615767f215f99a5bc40ace5af819dea23d65998b2d904ae0e5"
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
