class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.2/leani-v0.1.0-rc.2-aarch64-apple-darwin.tar.gz"
      sha256 "becd1196ca79ad5254e47413d46834b7cb62374c296549ae60c9dacc975315ec"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.2/leani-v0.1.0-rc.2-x86_64-apple-darwin.tar.gz"
      sha256 "9dba0914b30ec9df6eb33231691865489036f0413183bbed7090d325fd77d927"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.2/leani-v0.1.0-rc.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cf42ec11364b0ffbaa0f8d8dcf0bfd6f6019f7e5ad72267670ab6380c9e92270"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.2/leani-v0.1.0-rc.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf8b72d6b1993d845155f3cbf7d448024f070be94eafb8398e0206bdd2622016"
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
