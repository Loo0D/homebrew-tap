class Vidbmcp < Formula
  desc "VI DB MCP server — Vantage Intelligence source-catalog tools"
  homepage "https://github.com/VantageI/vidbmcp"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.2.0_darwin_arm64"
      sha256 "19e2ed16bc5fe56cc50ba149c21d3ea34a9155b218054f77abc79cf106da3d6b"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.2.0_darwin_amd64"
      sha256 "0fa23072828da4b03ae5ade8959a6a620939bbecbf10f38f84afd6ec20a4c045"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.2.0_linux_arm64"
      sha256 "38aaff31d863c25a907c9d0da464e306bdb33a49f3d282202d0d770d749f484c"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/vidbmcp_0.2.0_linux_amd64"
      sha256 "61d1a5cc0633566f1a82ff4bc92a7efca31cb9caf4d838a7dd238744496c11f9"
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
