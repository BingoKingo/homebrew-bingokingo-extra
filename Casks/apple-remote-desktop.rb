# [P] K'ed by TNT team from https://appstorrent.ru/, this is a Mac App Store edition from https://apps.apple.com/app/apple-remote-desktop/id409907375
cask "apple-remote-desktop" do
  version "3.9.7"
  sha256 :no_check

  url "https://vk.com/doc781359414_671626650",
      verified: "vk.com/"
  name "Apple Remote Desktop"
  desc "Remote desktop app by Apple"
  homepage "https://appstorrent.ru/164-apple-remote-desktop.html"

  livecheck do
    skip
  end

  container nested: "Manual install/Remote Desktop #{version} MAS [TNT].dmg"

  app "Remote Desktop.app", target: "Apple Remote Desktop.app"

  uninstall delete: ["/Library/Preferences/com.apple.RemoteDesktop.plist"]

  zap trash: [
    "~/Library/Application Scripts/com.apple.RemoteDesktop",
    "~/Library/Containers/com.apple.RemoteDesktop",
  ]
end
