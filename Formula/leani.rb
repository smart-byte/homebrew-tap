class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.8/leani-v0.1.0-rc.8-aarch64-apple-darwin.tar.gz"
      sha256 "c2be9dc1b97154d7796f8bfa6b4d1b93e049e9274f9b6382c658c2c04dd6c0f1"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.8/leani-v0.1.0-rc.8-x86_64-apple-darwin.tar.gz"
      sha256 "8ca52dc0e9145f64919b3019565a90f02e1b96fb612d84d2f42e442053dff75c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.8/leani-v0.1.0-rc.8-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "347e64fb47ae2ec73b15c6886c5c256d4abd7aa7a505edfc4b58310baf43a7f8"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.8/leani-v0.1.0-rc.8-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35b939103245738d513f4a8000db0250e3492b2f96703d3127f4b8fc515fd528"
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
