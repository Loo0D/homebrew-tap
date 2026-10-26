class Vidbmcp < Formula
  desc "VI DB MCP server — Vantage Intelligence source-catalog tools"
  homepage "https://github.com/VantageI/vidbmcp"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.0_darwin_arm64"
      sha256 "977ca8f950b0949f40a9360a3ba77e10fa7e785ed84e2a7b5e42e5d324d9ee9d"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.0_darwin_amd64"
      sha256 "4fd71732ef58d4960f4348ddf7db493b59561b72cabdd4b960288e119da91b48"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.0_linux_arm64"
      sha256 "0bcb3f330e1a6ee05eea703ba040dcb853a431e97e72447ff926ead5af58708b"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.1.0_linux_amd64"
      sha256 "11944d0b891ab80f99abbdca53dcf448bea7774e0ea3fdade60e7a14098b469f"
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
