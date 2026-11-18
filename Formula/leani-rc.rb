class LeaniRc < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.3/leani-v0.2.0-rc.3-aarch64-apple-darwin.tar.gz"
      sha256 "6e53e50b45fb21e8aba87524d2486bcbc6ab622bc2d0cde0286085d9c625a850"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.3/leani-v0.2.0-rc.3-x86_64-apple-darwin.tar.gz"
      sha256 "4a0042d1e477a66189188b59940e69aece2d28c290e5a15614076f793eb13d6a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.3/leani-v0.2.0-rc.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bc83a0343fb8e328072bdaceb13d6619a69906fddcafebad85847e56a6b8f5ff"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.3/leani-v0.2.0-rc.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52c0588905de4f5989e84eb1ee9a196ad547a684f1e4405cc7d26dd621b0c693"
    end
  end

  conflicts_with "leani", because: "both install a `leani` binary"

  def install
    bin.install "leani"
    pkgshare.install "LICENSE", "THIRD_PARTY_LICENSES.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/leani --version")
    system bin/"leani", "e2e", "fixture", "--blocks", "16",
           "--data-dir", testpath/"data", "--report", testpath/"fixture.json"
  end
end
