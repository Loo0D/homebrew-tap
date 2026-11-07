class PueueForAgents < Formula
  desc "Agent-oriented pueue fork — durable task queues for coding agents"
  homepage "https://github.com/Loo0D/pueue-for-agents"
  version "4.0.5-for-agents.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/pueue-for-agents_4.0.5-for-agents.1_darwin_arm64.tar.gz"
      sha256 "33c0167785de988cba249669664aa466656d092e2a17b5f91d02e9053a612546"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/pueue-for-agents_4.0.5-for-agents.1_darwin_amd64.tar.gz"
      sha256 "096b098fa2b9f39f2ea166385781fab58676cbbf716a165be8cc031e6085c131"
    end
  end

  on_linux do
    on_arm do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/pueue-for-agents_4.0.5-for-agents.1_linux_arm64.tar.gz"
      sha256 "73d65ed93df5e842400ac177627b007cebd33ee4ab0ba9fb560900e9c8251337"
    end
    on_intel do
      url "https://tap-ozoxoz.t3.tigrisfiles.io/pueue-for-agents_4.0.5-for-agents.1_linux_amd64.tar.gz"
      sha256 "d51a1bfe6be4ab45a63313b695e9ea92780439f21658b93e883ff8db652bba9d"
    end
  end

  def install
    bin.install "pueue", "pueued"
  end

  def caveats
    <<~EOS
      This formula installs `pueue` and `pueued`, the same binary names as the
      homebrew-core `pueue` formula, so the two cannot be linked side by side.
      Remove the upstream package first:

        brew uninstall pueue

      The daemon is not started for you. Run `pueued -d`, or supervise it with
      your init system of choice.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pueue --version")
    assert_match version.to_s, shell_output("#{bin}/pueued --version")
  end
end
