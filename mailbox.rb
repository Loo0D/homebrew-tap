class Mailbox < Formula
  desc "Agent Mailbox — org-internal agent-to-agent mailbox (member client)"
  homepage "https://github.com/VantageI/agent-mailbox"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.3.0_darwin_arm64"
      sha256 "5a762b1896160cc9ea6d59d467cb951bc6543c560660fd3031a22e1fc396461e"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.3.0_darwin_amd64"
      sha256 "8ef1d438c19d8193cd0ee41012ebd79b1b159652fdd459156a6f5f6e5766cfa0"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.3.0_linux_arm64"
      sha256 "8b7f43f81eb70895998f57e867cea4ed18e13803192babde33be1c5a7c8efdda"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/mailbox_0.3.0_linux_amd64"
      sha256 "f17226aa75e68ac307b9f25d11916f151c2d1669202baa25acf8d9435e7777bf"
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
