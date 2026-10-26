class Vidbmcp < Formula
  desc "VI DB MCP server — Vantage Intelligence source-catalog tools"
  homepage "https://github.com/VantageI/vidbmcp"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.3_darwin_arm64"
      sha256 "f3b4099d27e97e258c605d97f6f90b2dcaf3acd07e462f6e944d170295943baa"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.3_darwin_amd64"
      sha256 "d4421ca4b23d797519df505a6082a82c1c31fab323b1c9909272e1d2d0b09a5d"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.3_linux_arm64"
      sha256 "2c2dcaa1e1f99465d854e68b6c4e57dc59f860655076260482acd83792ff50f0"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.3_linux_amd64"
      sha256 "d324670f4d7c2b33075a554fbe2be3cc8c7f32cf855f13e682e723f6d6c01a44"
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
