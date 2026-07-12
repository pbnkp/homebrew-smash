class Smash < Formula
  desc "Unified encode/decode payload manager with AI semantic compression"
  homepage "https://github.com/pbnkp/smash"
  url "https://raw.githubusercontent.com/pbnkp/smash/main/smash"
  sha256 "19ceaf85ccbf4cec5af8beb41e983a2bb2047dad000277bbf0079e9a7d66fc51"
  version "5.0"
  license "MIT"

  depends_on "xz"

  def install
    bin.install "smash"
  end

  test do
    assert_match "smash v5.0", shell_output("#{bin}/smash --help 2>&1", 2)
  end
end
