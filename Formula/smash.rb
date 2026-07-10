class Smash < Formula
  desc "Unified encode/decode payload manager with AI semantic compression"
  homepage "https://github.com/pbnkp/smash"
  url "https://raw.githubusercontent.com/pbnkp/smash/main/smash"
  sha256 "98089bdd62d60500b36915d056728f2f6571d21c9fa4a53d731b5a0a1d10af90"
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
