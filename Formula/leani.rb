class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.9/leani-v0.1.0-rc.9-aarch64-apple-darwin.tar.gz"
      sha256 "49e01b8d3a76be6efeb3607b5acc79a02a20d0335ae5d247ad006537a3dc9d93"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.9/leani-v0.1.0-rc.9-x86_64-apple-darwin.tar.gz"
      sha256 "e04b868fc2856d7bb407f95084fbf3968fa04e9a937671c2cba9530b72cd3479"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.9/leani-v0.1.0-rc.9-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "acd1518cc1e5d33ad20667b3d5332bb69e1089a7c588b05a23e45bf5fbc0341d"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.9/leani-v0.1.0-rc.9-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3efa841064526321dd95c00044444b4e102e02677a2c870e443f7303134395e7"
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
