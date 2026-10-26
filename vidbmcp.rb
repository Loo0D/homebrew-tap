class Vidbmcp < Formula
  desc "VI DB MCP server — Vantage Intelligence source-catalog tools"
  homepage "https://github.com/VantageI/vidbmcp"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.2_darwin_arm64"
      sha256 "8515120d4ed1f402824beba4f099be0633e30b1bd0a56a6a04cff507be2d7abd"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.2_darwin_amd64"
      sha256 "c52d49b55a0ef15b9c3feb18f11512da96601fe761f5a4cebaa6d4440d2356a5"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.2_linux_arm64"
      sha256 "52884ca1592def4cca755b510e61550eb78b2ff2f7f981dde3c2f25b564acb51"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.2_linux_amd64"
      sha256 "21bb5f506af14cfa20439a3e6bea79dad7ae6e628ce82ae1d36bdd1babac5cc2"
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
