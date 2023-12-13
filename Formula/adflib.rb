class Adflib < Formula
  desc "Free, portable and open implementation of the Amiga filesystem"
  homepage "https://github.com/lclevy/ADFlib/"
  url "https://github.com/lclevy/ADFlib/archive/v#{version}.tar.gz"
  version "0.8.0"
  license "GPL-2.0-only"

  if OS.mac?
    url "https://github.com/lclevy/ADFlib/releases/download/v#{version}/adflib-#{version}-macos.zip"
    sha256 "c3d54df57c4c7c86cb8148ad36c18f0209e9d42acc5cff305fa11b7c2363f6c2"
  end

  livecheck do
    url :url
    strategy :github_latest
  end

  def install
    prefix.install Dir["adflib-macos.tgz/usr/local/*"]
  end

  test do
    system bin/"kuberlr", "version"
  end
end
