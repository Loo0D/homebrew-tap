class Vidbmcp < Formula
  desc "VI DB MCP server — Vantage Intelligence source-catalog tools"
  homepage "https://github.com/VantageI/vidbmcp"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.1_darwin_arm64"
      sha256 "f88695474a9e8a55d9b5c6eea96f69b5bb8e558a9053a6cf93708b8d4c200016"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.1_darwin_amd64"
      sha256 "511b75f4a6ce1cdac9a0c8d8a535419919a134538c21e47efc2b859b1ffa376f"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.1_linux_arm64"
      sha256 "e1afeaf23d22235d8fc687a8cdbbee2db8243b6a72e2b7f70585b4ec43f67fb3"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.1_linux_amd64"
      sha256 "096860d042fdc94f1ad768ccf65e1dc9ce73cfa1797c58e42fafd0cfa5805f73"
    end
  end

  def install
    os_part = OS.mac? ? "darwin" : "linux"
    arch_part = Hardware::CPU.arm? ? "arm64" : "amd64"
    bin.install "vidbmcp_#{version}_#{os_part}_#{arch_part}" => "vidbmcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vidbmcp --version")
  end
end
