class Viaibot < Formula
  desc "VIAIBot CLI — AI research, OSINT, and investigation tools"
  homepage "https://github.com/VantageI/viaibot-api"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.2.0_darwin_arm64"
      sha256 "4d3a1a27c3dbdb9a94e30a3486257a493510ebcbaacc1688a468ca71f77142f7"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.2.0_darwin_amd64"
      sha256 "24404296a35d790ab72494940a365faa8c40ead1aa16805ff4608b79f59713bc"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.2.0_linux_arm64"
      sha256 "de971e99114fdb528a205be6fd70d9960da4522247d6e2a35923cee8e55687e2"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.2.0_linux_amd64"
      sha256 "755db9aa7ba248320fa13f4fe1ef54c8f2dcfa33ad68cc7ca0914a4861d84a2a"
    end
  end

  def install
    os_part = OS.mac? ? "darwin" : "linux"
    arch_part = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "viaibot_#{version}_#{os_part}_#{arch_part}" => "viaibot"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/viaibot --version")
  end
end
