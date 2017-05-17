class LinuxmainGenerator < Formula
  desc "Shell command to keep SPM tests in sync on OSX and Linux."
  homepage "https://github.com/valeriomazzeo/linuxmain-generator"
  url "https://github.com/valeriomazzeo/homebrew-linuxmain-generator/archive/0.2.1.tar.gz"
  version "0.2.1"
  sha256 "bb32793dca645bde67ee3520350d65437c12467f59177cda3e44e9e14738ee94"

  def install
    ENV["CC"] = ""
    system "swift", "build", "-c", "release"
    bin.install ".build/release/linuxmain-generator"
  end
end
