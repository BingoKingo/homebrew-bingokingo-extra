# [P] K'ed by TNT team from https://appstorrent.ru/, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/r/rightfont.rb
cask "rightfont" do
  version "8.5"
  sha256 :no_check

  url "https://vk.com/doc781359414_674846435"
  name "RightFont"
  desc "Font manager that helps preview, install, sync and manage fonts"
  homepage "https://appstorrent.ru/268-rightfontapp.html"

  livecheck do
    url "https://rightfontapp.com/update/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: ">= :catalina"

  container nested: "Manual install/RightFont #{version.csv.first} [TNT].dmg"

  app "RightFont.app"

  zap trash: [
        "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.rightfontapp.rightfont*.sfl*",
        "~/Library/Application Support/com.rightfontapp.RightFont*",
        "~/Library/Application Support/RightFont",
        "~/Library/Caches/com.rightfontapp.RightFont*",
        "~/Library/Logs/RightFont*",
        "~/Library/Preferences/com.rightfontapp.RightFont*.plist",
        "~/Library/WebKit/com.rightfontapp.RightFont*",
      ],
      rmdir: "~/RightFont"
end
