class Leani < Formula
  desc "Lean, state-minimized Ethereum indexing node"
  homepage "https://github.com/smart-byte/leani"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.6/leani-v0.1.0-rc.6-aarch64-apple-darwin.tar.gz"
      sha256 "4d136347cc9c083bdbb6cb3864ebd744a4db5d51d1128cef63bab893634ef26e"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.6/leani-v0.1.0-rc.6-x86_64-apple-darwin.tar.gz"
      sha256 "fa6ca63fa94679e175179005ee53065c92317ccf85155b36b4514b8bc324c381"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.6/leani-v0.1.0-rc.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d31c8faefb7005eaf7c143fbc4d2b889bef19ad49caa3f59eb5a78fac6f64e3"
    else
      url "https://github.com/smart-byte/leani/releases/download/v0.1.0-rc.6/leani-v0.1.0-rc.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7cb9bde83d2daa3bf607d52939134ea558f4521d738b613a560f502bc31ee95a"
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
