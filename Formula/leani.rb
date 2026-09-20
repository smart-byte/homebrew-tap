class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.1/leani-v0.1.0-rc.1-aarch64-apple-darwin.tar.gz"
      sha256 "e12ad403cc6efa27778b225619f245069fc4f05df460cfd6f9943eff5e412165"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.1/leani-v0.1.0-rc.1-x86_64-apple-darwin.tar.gz"
      sha256 "1338dce55e03099526d8198e77baa8e5b8c0ebc6a0a2ed3b880eb69f2f2db450"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.1/leani-v0.1.0-rc.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "61f1e7b902d3c3aee40f660e5b6c10458c8a3caaae50f2d8cc723866052779bb"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.1/leani-v0.1.0-rc.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f4fddad8b47eeb6605abc64802cb32bd9090dbec1b47f125e46ebe568f86a26b"
    end
  end

  def install
    bin.install "leani"
    pkgshare.install "THIRD_PARTY_LICENSES.txt"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/leani --version")
    system bin/"leani", "e2e", "fixture", "--blocks", "16",
           "--data-dir", testpath/"data", "--report", testpath/"fixture.json"
  end
end
