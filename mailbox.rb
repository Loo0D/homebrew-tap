class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.6.0_darwin_arm64"
      sha256 "8283cca201e30d4c2d3a3b93fffc367ece82d35291b4cdcc6ff2320e0994727e"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.6.0_darwin_amd64"
      sha256 "cbc81ba3517c456d331eab0ae0551d0eb6f4aff7d09f1485983c4390a7e4dfa9"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.6.0_linux_arm64"
      sha256 "472de8ba683847add8296c2a2a0f3f44d242bdd69a75695dffca423203c5d90e"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.6.0_linux_amd64"
      sha256 "7e72382fc6eb5aa8816e19a101c705622d521b0044021b3e1c890a57b66e7680"
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
