class Smash < Formula
  desc "Unified encode/decode payload manager with AI semantic compression"
  homepage "https://github.com/pbnkp/smash"
  url "https://raw.githubusercontent.com/pbnkp/smash/main/smash"
  sha256 "5d190e60f02d6afffeb6638596eebf383d66d33924c33ffa54c103b9af2ead95"
  version "5.3"
  license "MIT"

  depends_on "xz"

  def install
    bin.install "smash"
  end

  test do
    assert_match "smash v5.3", shell_output("#{bin}/smash --help 2>&1", 2)
  end
end
