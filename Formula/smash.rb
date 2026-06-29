class Smash < Formula
  desc "Unified encode/decode payload manager with AI semantic compression"
  homepage "https://github.com/pbnkp/smash"
  url "https://raw.githubusercontent.com/pbnkp/smash/main/smash"
  sha256 "7f89a3ce6b30a0a3e91530d1d38d1442fc711988fc352e06953a6ddb8811b800"
  version "4.5"
  license "MIT"

  depends_on "xz"

  def install
    bin.install "smash"
  end

  test do
    assert_match "smash v4.5", shell_output("#{bin}/smash --help 2>&1", 2)
  end
end
