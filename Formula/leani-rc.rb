class LeaniRc < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.2/leani-v0.2.0-rc.2-aarch64-apple-darwin.tar.gz"
      sha256 "361ba607cf5baf7d7e2d026559b347a72af8511af62ae1751f43a2d94846ae61"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.2/leani-v0.2.0-rc.2-x86_64-apple-darwin.tar.gz"
      sha256 "b7e680ad05017ea2229d87bd71b3b1e7f6421420e05046dc3d8373f6fe54ef05"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.2/leani-v0.2.0-rc.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "33e2928f35caa6591a6913df5ab2aaf29f1e943c21d64f877b85d2b565b2ee3b"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.2/leani-v0.2.0-rc.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "63308644eca299da7b6b136f1c06a11ab825ca364f90dcc5d9bf7c1e0b8a4fc1"
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
