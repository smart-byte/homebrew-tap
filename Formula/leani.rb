class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.5/leani-v0.1.0-rc.5-aarch64-apple-darwin.tar.gz"
      sha256 "0552b6435d5bce7f9ea77b7a9e712472dc31f74f268fa801a5d2ba708c370f9a"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.5/leani-v0.1.0-rc.5-x86_64-apple-darwin.tar.gz"
      sha256 "b6e2a1bd99cba6cf405626c3b8bdfc9f9dcdd39b8dce1264b6b1dce89cf807b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.5/leani-v0.1.0-rc.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25e37c8226b803ab8b37cfbbf9121794b332bfa29f99eee8ded3b33f5c1ae828"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.5/leani-v0.1.0-rc.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e95eb2875a373be565cc4b55009f9c7d90aff64340429f7a83b4664f5d4fe6e1"
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
