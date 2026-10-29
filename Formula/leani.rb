class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.1/leani-v0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "43a94079239ed10bc4be5a718cd73ef467a9c94f18c415d52def019005967c49"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.1/leani-v0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "99074b21d9fec0701f1d7c8ef61ad84ee9dab1daf5a06777680e830df9a78417"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.1/leani-v0.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7b4c2f324e392cd9960f31df93af9c8a4ef301c35bd27e365d82204be3f5915"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.1/leani-v0.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e85fdc49c859aef0ac3ad90cf8fc17c85740da5ca0ec4158ad3ad168de38f103"
    end
  end

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
