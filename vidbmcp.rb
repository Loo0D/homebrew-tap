class Vidbmcp < Formula
  desc "VI DB MCP server — Vantage Intelligence source-catalog tools"
  homepage "https://github.com/VantageI/vidbmcp"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.2.1_darwin_arm64"
      sha256 "71f7ff9b152b03c30766c55bc3e2a4c1784a59412669751bd1636902736ec9ec"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.2.1_darwin_amd64"
      sha256 "20e75b0163f9f0607406b36aff2466d01df08760877fc6755dc47324b7a1c13f"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.2.1_linux_arm64"
      sha256 "5b44838c5b9aaabd33e621d2d3dd96fb2766dea209066e56c0778780f48e2af9"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.2.1_linux_amd64"
      sha256 "6cfe79dc25e81fbe148fcfdeccdea81ac84b9063f96bf3df5c48ec8f0f935f4d"
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
