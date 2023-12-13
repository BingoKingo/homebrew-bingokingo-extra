# [P] K'ed by TNT team from https://appstorrent.ru/, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/l/loopback.rb
cask "loopback" do
  version "2.3.2"
  sha256 :no_check

  url "https://vk.com/doc781359414_671420478",
      verified: "vk.com/"
  name "Loopback"
  desc "Cable-free audio router"
  homepage "https://appstorrent.ru/333-loopback.html"

  livecheck do
    url :url
    strategy :extract_plist
  end

  depends_on macos: ">= :catalina"
  container nested: "Manual install/Loopback #{version} [TNT].dmg"

  app "Loopback.app"

  zap trash: [
    "~/Library/Application Support/Loopback",
    "~/Library/Caches/com.rogueamoeba.Loopback",
    "~/Library/Caches/com.rogueamoeba.loopbackd",
    "~/Library/LaunchAgents/com.rogueamoeba.loopbackd.plist",
    "~/Library/Preferences/com.rogueamoeba.Loopback.plist",
    "~/Library/Preferences/com.rogueamoeba.loopbackd.plist",
    "~/Library/WebKit/com.rogueamoeba.Loopback",
  ]
end
