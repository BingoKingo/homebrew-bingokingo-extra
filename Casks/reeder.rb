# [P] K'ed by TNT team from https://appstorrent.ru/, this is a Mac App Store edition from https://apps.apple.com/app/reeder-5/id1529448980
cask "reeder" do
  version "5.4"
  sha256 :no_check

  url "https://vk.com/doc249553273_668587412",
      verified: "vk.com/"
  name "Reeder"
  desc "News Reader"
  homepage "https://appstorrent.ru/804-reeder.html"

  livecheck do
    skip
  end

  # container nested: "Manual install/Reeder #{version} MAS [TNT].dmg"

  app "Reeder.app"

  zap trash: [
    "~/Library/Application Scripts/66JC38RDUD.com.reederapp",
    "~/Library/Application Scripts/com.reederapp.5.macOS",
    "~/Library/Application Scripts/com.reederapp.5.macOS.Intents",
    "~/Library/Application Scripts/com.reederapp.5.macOS.ReadLater",
    "~/Library/Application Scripts/com.reederapp.5.macOS.SafariReadLater",
    "~/Library/Application Scripts/com.reederapp.5.macOS.SafariSubscribe",
    "~/Library/Application Scripts/com.reederapp.5.macOS.Widget",
    "~/Library/Containers/com.reederapp.5.macOS",
    "~/Library/Containers/com.reederapp.5.macOS.Intents",
    "~/Library/Containers/com.reederapp.5.macOS.ReadLater",
    "~/Library/Containers/com.reederapp.5.macOS.SafariReadLater",
    "~/Library/Containers/com.reederapp.5.macOS.SafariSubscribe",
    "~/Library/Containers/com.reederapp.5.macOS.Widget",
    "~/Library/Group Containers/66JC38RDUD.com.reederapp",
  ]
end
