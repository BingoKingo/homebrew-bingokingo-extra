# [P] K'ed by TNT team from https://appstorrent.ru/.
cask "capture-one" do
  version "16.3.4.5"
  sha256 :no_check

  url "https://vk.com/doc781359414_675135646",
      verified: "vk.com/"
  name "Capture One"
  desc "RAW photo editing, tethering photo culling, smart adiustments"
  homepage "https://appstorrent.ru/87-capture-one.html"

  livecheck do
    skip
  end

  container nested: "Manual install/Capture One #{version} [TNT].dmg"

  app "Capture One 23.app"

  zap trash: [
    "~/Library/Application Support/com.captureone.captureone16",
    "~/Library/Caches/com.captureone.captureone16",
    "~/Library/HTTPStorages/com.captureone.captureone16",
    "~/Library/HTTPStorages/com.captureone.captureone16.binarycookies",
    "~/Library/Logs/CaptureOneCC.log",
    "~/Library/Logs/CaptureOneCCS.log",
    "~/Library/Logs/CaptureOneIC.log",
    "~/Library/Logs/CaptureOneICP.log",
    "~/Library/Logs/CaptureOneMC.log",
    "~/Library/Logs/CaptureOneTangent.log",
    "~/Library/Logs/com.captureone.COFrameioPluginPluginHost.log",
    "~/Library/Logs/com.captureone.COOpenWithPluginPluginHost.log",
    "~/Library/Logs/com.captureone.captureone16.log",
    "~/Library/Preferences/com.captureone.COFrameioPluginPluginHost.plist",
    "~/Library/Preferences/com.captureone.COOpenWithPluginPluginHost.plist",
    "~/Library/Preferences/com.captureone.captureone16.plist",
    "~/Library/WebKit/com.captureone.captureone16",
  ]
end
