class Viaibot < Formula
  desc "VIAIBot CLI — AI research, OSINT, and investigation tools"
  homepage "https://github.com/VantageI/viaibot-api"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.3.1_darwin_arm64"
      sha256 "6e7b29d181d0fea95177e61fb4874ca1eea8c822fd45abb7e0b950be5179e6e2"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.3.1_darwin_amd64"
      sha256 "128d23cd9bdf848aad83dbca2fe0d963d8c718d5c45676dc577b53c05b5893b7"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.3.1_linux_arm64"
      sha256 "ed976aa89eff5a130141b9368546653e9b9b5e8776e7e8c0f76a6a0ffaac3f3f"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.3.1_linux_amd64"
      sha256 "40e6ed90a70cea62a06ac8894a69bb63402fc7d4dc7db9fb3fb542798db1a087"
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
