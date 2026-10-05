class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.3/leani-v0.1.0-rc.3-aarch64-apple-darwin.tar.gz"
      sha256 "53e706d3961085c419bb5924976d4d4013757b8efc8eb91d852836f52c98ad92"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.3/leani-v0.1.0-rc.3-x86_64-apple-darwin.tar.gz"
      sha256 "3a53257c1915f7470035ae2eea85d72b236eec05f04159fbb22abcb7a5d777f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.3/leani-v0.1.0-rc.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e572b18d2ef24195474b31e3846c57eb0f9a8b48a11a46fe504952c65b2cc923"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.3/leani-v0.1.0-rc.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "46a064e444e93f668ab1e858f706b740ef0a9152fc8519073e2dc16261e89c49"
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
