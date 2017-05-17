class LinuxmainGenerator < Formula
  desc "Shell command to keep SPM tests in sync on OSX and Linux."
  homepage "https://github.com/valeriomazzeo/linuxmain-generator"
  url "https://github.com/valeriomazzeo/homebrew-linuxmain-generator/archive/0.2.2.tar.gz"
  version "0.2.2"
  sha256 "c26c8a714fe12a66bd72d59e71d06f0bd61b05e4ec9bc4dee11c538b94646b9f"

  def install
    ENV["CC"] = ""
    system "swift", "build", "-c", "release"
    bin.install ".build/release/linuxmain-generator"
  end
end
