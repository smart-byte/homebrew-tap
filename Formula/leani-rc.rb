class LeaniRc < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.1/leani-v0.2.0-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "1c752179d8960f2c574427992ca909c7167436817685ab28f09ab83a8405f533"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.1/leani-v0.2.0-rc.1-x86_64-apple-darwin.tar.gz"
      sha256 "c1af6da3f907cd0f45ee7cae607ec93a7a9a87e9ae599bc3d828e6ab4c2a9c62"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.1/leani-v0.2.0-rc.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2c55f61dbee21bcd2da1c87f2fe1e9158397ab91f993a28196cd4cbce1ea1af9"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.2.0-rc.1/leani-v0.2.0-rc.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "10c18ff1cd2874bf26d063d61860a8844a0ffe2d8b1f1524c0ac7f6571ce5337"
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
