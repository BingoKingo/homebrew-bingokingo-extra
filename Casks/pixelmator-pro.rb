# [P] K'ed by TNT team from https://appstorrent.ru/, this is a Mac App Store edition.
cask "pixelmator-pro" do
  version "3.4.1"
  sha256 :no_check

  url "https://vk.com/s/v1/doc/pkn2yqoRW8oUVJIAxZHu4-HB1S99htRUASPJX-cS3bx3JQQcw5I",
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
