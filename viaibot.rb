class Viaibot < Formula
  desc "VIAIBot CLI — AI research, OSINT, and investigation tools"
  homepage "https://github.com/VantageI/viaibot-api"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.1.0_darwin_arm64"
      sha256 "5d1008e84272b53307563db19da216a404523a6325c1fa448e19c0b84fc9daa4"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.1.0_darwin_amd64"
      sha256 "d7c4a292b353f9a5bf8da48b9ba1724f7f71bc33566f5387fa660cad926fecd7"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.1.0_linux_arm64"
      sha256 "7dad46f57593a709e55b00cdc13ddf3c3ba097d2bb6228221e79dd7dbf5fedc6"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.1.0_linux_amd64"
      sha256 "f19957be164c2cedf0e20f6fcee895e6b92b79048c10484e2620c507605f3890"
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
