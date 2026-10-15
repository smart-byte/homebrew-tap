class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.7/leani-v0.1.0-rc.7-aarch64-apple-darwin.tar.gz"
      sha256 "190f314e8bd6289d7ed1fa3152cb287ba79b407a95ed0bb1ef5a9f14b9820c02"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.7/leani-v0.1.0-rc.7-x86_64-apple-darwin.tar.gz"
      sha256 "cadb67336f22fad3527a5d33471be7d9e85deb19620473ac10c3b6cfec76c0c1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.7/leani-v0.1.0-rc.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "90f5bab1ef69ba18a2e394edaca4f082a0ff35ef5e9ce94120aeeed67dca7d4b"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.7/leani-v0.1.0-rc.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c36635d93127e2289cbccbc1bdb7823d6923f1074bcb7e33a2a23293ea647c1"
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
