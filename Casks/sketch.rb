# [P] K'ed by TNT team from https://appstorrent.ru/, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/s/sketch.rb
cask "sketch" do
  on_big_sur :or_older do
    version "96.3,167315"
    sha256 :no_check

    url "https://vk.com/doc781359414_663425314",
        verified: "vk.com/"

    livecheck do
      skip "Legacy version"
    end

    depends_on macos: ">= :big_sur"
  end
  on_monterey :or_newer do
    version "99.5,178873"
    sha256 :no_check

    url "https://vk.com/doc781359414_675280854",
        verified: "vk.com/"

    livecheck do
      url "https://download.sketch.com/sketch-versions.xml"
      strategy :sparkle
    end

    depends_on macos: ">= :monterey"
  end

  name "Sketch"
  desc "Digital design and prototyping platform"
  homepage "https://appstorrent.ru/52-sketch.html"

  auto_updates true
  container nested: "Manual install/Sketch #{version.csv.first} [TNT].dmg"

  app "Sketch.app"

  zap trash: [
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.bohemiancoding.sketch3.sfl*",
    "~/Library/Application Support/com.bohemiancoding.sketch3",
    "~/Library/Autosave Information/com.bohemiancoding.sketch3.plist",
    "~/Library/Caches/com.bohemiancoding.sketch3",
    "~/Library/Caches/com.plausiblelabs.crashreporter.data/com.bohemiancoding.sketch3",
    "~/Library/Cookies/com.bohemiancoding.sketch3.binarycookies",
    "~/Library/HTTPStorages/com.bohemiancoding.sketch3.binarycookies",
    "~/Library/Logs/com.bohemiancoding.sketch3",
    "~/Library/Preferences/com.bohemiancoding.sketch3.LSSharedFileList.plist",
    "~/Library/Preferences/com.bohemiancoding.sketch3.plist",
    "~/Library/Saved Application State/com.bohemiancoding.sketch3.savedState",
  ]
end
