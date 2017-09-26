class LinuxmainGenerator < Formula
  desc "Shell command to keep SPM tests in sync on OSX and Linux."
  homepage "https://github.com/valeriomazzeo/linuxmain-generator"
  url "https://github.com/valeriomazzeo/homebrew-linuxmain-generator/archive/0.3.0.tar.gz"
  version "0.3.0"
  sha256 "af32e4392f3a3d587384b8df1b22ac20d6dfaa0b53dbf334544219b2abdd499f"

  def install
    ENV["CC"] = ""
    system "swift", "build", "-c", "release"
    bin.install ".build/release/linuxmain-generator"
  end
end
