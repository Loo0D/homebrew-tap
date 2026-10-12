class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.1_darwin_arm64"
      sha256 "39ce4f382d5dc4c0489416f80d99434a34f42359957fdb9b22ccb08c400084b2"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.1_darwin_amd64"
      sha256 "f85480d926c7c994171228a2fd5f26443bef6c0d70143d00ad1c56d6138ce0a2"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.1_linux_arm64"
      sha256 "d00c5f372c2a4454337a2481cde98c0fc6c10f62b981ea05f36d3611b8403ede"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.7.1_linux_amd64"
      sha256 "6042169ec636785be0e65a94c0e22ca1eaba7ad9b5a6b7c45e9d194b497406f7"
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
