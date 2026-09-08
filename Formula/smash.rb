class Smash < Formula
  desc "Unified encode/decode payload manager with verified-candidate compression"
  homepage "https://github.com/pbnkp/smash"
  url "https://raw.githubusercontent.com/pbnkp/smash/main/smash"
  sha256 "54be028843a386e59c923356b4d02f5fb9bcb3a02cc9afeeae74d1933e3302f3"
  version "6.0"
  license "MIT"

  # Hard requirements: smash dies at startup without these.
  depends_on "xz"
  depends_on "openssl@3"

  # The v6.0 superposition engine builds a candidate chain per codec and ships
  # the smallest one that survives a byte-exact round-trip. Each of these adds
  # candidates; without them the engine still works, it just has fewer options
  # and produces larger artifacts.
  depends_on "brotli"
  depends_on "zstd"
  depends_on "python@3.13"   # base85 alphabet + the tsv1 columnar transform

  # Optional, feature-gated at runtime:
  #   jpeg-xl  -> lossless JPEG transcode candidate (cjxl/djxl)
  #   age      -> --encrypt
  # Neither is required; smash detects absence and simply drops those chains.
  uses_from_macos "gzip"

  def install
    bin.install "smash"
  end

  test do
    assert_match "smash v6.0", shell_output("#{bin}/smash --help 2>&1", 2)

    # Round-trip proof: encode, decode, and require byte-identical output.
    (testpath/"probe.txt").write("smash formula round-trip probe\n" * 64)
    original = (testpath/"probe.txt").read
    system bin/"smash", "-q", "-o", testpath, testpath/"probe.txt"
    rm testpath/"probe.txt"
    system bin/"smash", "-q", "-d", testpath/"probe.txt.smash.txt"
    assert_equal original, (testpath/"probe.txt").read
  end
end
