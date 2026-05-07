class Smash < Formula
  desc "Unified encode/decode payload manager with AI semantic compression"
  homepage "https://github.com/pbnkp/smash"
  url "https://raw.githubusercontent.com/pbnkp/smash/main/smash"
  sha256 "27640f94e98e8176dd48ed44681888e3e3ffe6b0d1a5d92d1c3d45f6478ce7e2"
  version "4.4"
  license "MIT"

  depends_on "xz"

  def install
    bin.install "smash"
  end

  test do
    assert_match "smash v4.4", shell_output("#{bin}/smash --help 2>&1", 2)
  end
end
