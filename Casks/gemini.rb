# [P] K'ed by TNT team from https://appstorrent.ru/, modified from: https://github.com/Homebrew/homebrew-cask/blob/HEAD/Casks/g/gemini.rb
cask "gemini" do
  version "2.9.11,399,1696867671"
  sha256 :no_check

  url "https://vk.com/doc781359414_671045977",
      verified: "vk.com/"
  name "Gemini"
  desc "Disk space cleaner that finds and deletes duplicated and similar files"
  homepage "https://appstorrent.ru/7-gemini.html"

  livecheck do
    url "https://updates.devmate.com/com.macpaw.site.Gemini#{version.major}.xml"
    regex(%r{/(\d+)/Gemini\d*?[_-]v?(\d+(?:\.\d+)*)\.(?:dmg|zip)}i)
    strategy :sparkle do |item, regex|
      match = item.url.match(regex)
      next if match.blank?

      "#{item.short_version},#{match[2]},#{match[1]}"
    end
  end

  container nested: "Manual install/Gemini #{version.major} #{version.csv.first} [TNT].dmg"
  app "Gemini #{version.major}.app"

  zap trash: [
    "~/Library/Application Support/Gemini*",
    "~/Library/Caches/com.macpaw.site.Gemini*",
    "~/Library/Cookies/com.macpaw.site.Gemini*.binarycookies",
    "~/Library/Logs/com.macpaw.site.Gemini*",
    "~/Library/Preferences/com.macpaw.site.Gemini*",
    "~/Library/Saved Application State/com.macpaw.site.Gemini*",
    "/Users/Shared/Gemini #{version.major}",
  ]
end
