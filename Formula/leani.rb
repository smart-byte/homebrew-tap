class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.4/leani-v0.1.0-rc.4-aarch64-apple-darwin.tar.gz"
      sha256 "ad271ce15af04746b4e0133bf4538d291669d5d10b20f61cd0578c28f5fa90e6"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.4/leani-v0.1.0-rc.4-x86_64-apple-darwin.tar.gz"
      sha256 "98fd3f9c7ccc0bab0ae993ff41ba5c03dbc60aa7d5428bc4c37075e33425a894"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.4/leani-v0.1.0-rc.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "10ee3b4541ef163ee9bff6d9b07432f627eb0fce5bda6348ecbe1d5e4122b14a"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.4/leani-v0.1.0-rc.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c7d844c8a4931f55bda003de793df883c2ca11d7a73c29314c9573acf2e9930"
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
