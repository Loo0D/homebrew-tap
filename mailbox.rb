class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.0_darwin_arm64"
      sha256 "7125e2246ad28b70b7ff04c75c1ec392b7fc5a8a9a1f32cc44215962b03b08e3"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.0_darwin_amd64"
      sha256 "8c06df2f3225352bc11ccd125bf827c56015532bf9b4d3eb6afed99a5f9873eb"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.0_linux_arm64"
      sha256 "ffb51a9a10e00a4e2f59c7da0d76ff802060cc2154da6a0f24433bd543b4e00a"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.0_linux_amd64"
      sha256 "e6baa714982ebca891c19732542039f5618986b1e0c14b391cf8265aa1cf3db6"
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
