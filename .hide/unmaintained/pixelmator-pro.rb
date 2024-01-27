# [P] K'ed by TNT team from https://appstorrent.ru/, this is a Mac App Store edition from https://apps.apple.com/app/pixelmator-pro/id1289583905
cask "pixelmator-pro" do
  version "3.5.6"
  sha256 :no_check

  url "https://vk.com/doc781359414_675374875",
      verified: "vk.com/"
  name "Pixelmator Pro"
  desc "Pro image editing for everyone"
  homepage "https://appstorrent.ru/32-pixelmator-pro.html"

  livecheck do
    skip
  end

  container nested: "Manual install/Pixelmator Pro #{version} MAS [TNT].dmg"

  app "Pixelmator Pro.app"

  zap trash: ["~/Library/Application Scripts/4R6749AYRE.com.pixelmator",
              "~/Library/Application Scripts/com.pixelmatorteam.pixelmator.x",
              "~/Library/Application Scripts/com.pixelmatorteam.pixelmator.x.photos-extension",
              "~/Library/Application Scripts/com.pixelmatorteam.pixelmator.x.quicklookpreviewextension",
              "~/Library/Application Scripts/com.pixelmatorteam.pixelmator.x.remove-background",
              "~/Library/Application Scripts/com.pixelmatorteam.pixelmator.x.thumbnailextension",
              "~/Library/Containers/com.pixelmatorteam.pixelmator.x",
              "~/Library/Containers/com.pixelmatorteam.pixelmator.x.photos-extension",
              "~/Library/Containers/com.pixelmatorteam.pixelmator.x.quicklookpreviewextension",
              "~/Library/Containers/com.pixelmatorteam.pixelmator.x.remove-background",
              "~/Library/Containers/com.pixelmatorteam.pixelmator.x.thumbnailextension",
              "~/Library/Group Containers/4R6749AYRE.com.pixelmator"]
end
