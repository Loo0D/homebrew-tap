class Viaibot < Formula
  desc "VIAIBot CLI — AI research, OSINT, and investigation tools"
  homepage "https://github.com/VantageI/viaibot-api"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.3.0_darwin_arm64"
      sha256 "7dd87d3b3bad0649f73aae3c9dd4aee091079b87e6fad0e00f0f9ec5b08b015d"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.3.0_darwin_amd64"
      sha256 "d01942b01474b4741a5ba26b32c4b5b71915344fd70b87fbaa9647df370b2da6"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.3.0_linux_arm64"
      sha256 "298684009078f07880fac10565e4bcd285ba4f947bed90cb26981fed9c009815"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/viaibot_0.3.0_linux_amd64"
      sha256 "dc6b92b016871ec884a0b340896a60ff162be10304bb7dcfc5f6faeabb23a664"
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
