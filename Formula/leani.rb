class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0/leani-v0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "66810255758cacd6c2fb73903b6b5dd058e9aaeeb43c030183da371c5a5143d2"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0/leani-v0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "52d01479aac3fcd6444e9a117b735b0a478a09d6233beb6224777e025bb85d8f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0/leani-v0.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b8022b7c9d80134f6b55a155edbf6f3957386d5c3e8e080b62f700f104d9818d"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0/leani-v0.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b8f398c4b07a45254e3a5d93459079f3a1982c6700743286cd44488af3831c56"
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
