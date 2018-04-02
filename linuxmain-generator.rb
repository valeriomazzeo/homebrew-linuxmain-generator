class LinuxmainGenerator < Formula
  desc "Shell command to keep SPM tests in sync on OSX and Linux."
  homepage "https://github.com/valeriomazzeo/linuxmain-generator"
  url "https://github.com/valeriomazzeo/homebrew-linuxmain-generator/archive/0.3.1.tar.gz"
  version "0.3.1"
  sha256 "4c8799f99672e021d511f6d9bf452d3d0e3dac13cee978599e0a5ea4f0515d07"

  def install
    ENV["CC"] = ""
    system "swift", "build", "--disable-sandbox", "-c", "release"
    bin.install ".build/release/linuxmain-generator"
  end
end
