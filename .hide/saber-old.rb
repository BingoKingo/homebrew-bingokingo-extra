cask "saber" do
  version "0.11.4"
  sha256 "c7783e3893b924d7afa96664f496eb10c90344cddba8b33a2f65f94ab532570a"

  vmajor = "" if version.major <= 1
  vminor = "0#{version.minor}" if version.minor <= 9
  vpatch = "0#{version.patch}" if version.patch <= 9

  url "https://github.com/adil192/saber/releases/download/v#{version}/Saber_v#{version}_#{vmajor}#{vminor}#{vpatch}0.app.zip"
  name "Saber"
  desc "Cross-platform libre handwritten notes app"
  homepage "https://github.com/adil192/saber/"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "Saber.app"

  zap trash: [
    "~/Library/Containers/com.adilhanney.saber",
    "~/Library/Application Scripts/com.adilhanney.saber",
  ]
end
