# [P] K'ed by TNT team from https://appstorrent.ru/, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/b/betterzip.rb
cask "betterzip" do
  version "5.3.4"
  sha256 :no_check

  url "https://vk.com/s/v1/doc/vcoD9IML_U-cRW8MVbwJwp_FDrXobUQDOZ01VerKX1uNa6aQcrI",
      verified: "vk.com/"
  name "BetterZip"
  desc "Utility to create and modify archives"
  homepage "https://appstorrent.ru/341-betterzip.html"

  livecheck do
    url "https://macitbetter.com/BetterZip.zip"
    strategy :header_match
  end

  depends_on macos: ">= :high_sierra"
  container nested: "Manual install/BetterZip #{version} [TNT].dmg"

  app "BetterZip.app"

  zap trash: [
    "~/Library/Application Scripts/com.macitbetter.betterzip.findersyncextension",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.macitbetter.betterzip.sfl*",
    "~/Library/Application Support/com.macitbetter.betterzip",
    "~/Library/Caches/com.apple.helpd/Generated/com.macitbetter.betterzip.help*",
    "~/Library/Caches/com.macitbetter.betterzip",
    "~/Library/Containers/com.macitbetter.betterzip.findersyncextension",
    "~/Library/Group Containers/79RR9LPM2N.group.com.macitbetter.betterzip",
    "~/Library/Group Containers/79RR9LPM2N.group.com.macitbetter.betterzip-setapp",
    "~/Library/Preferences/com.macitbetter.betterzip.plist",
    "~/Library/Saved Application State/com.macitbetter.betterzip.savedState",
  ]
end
