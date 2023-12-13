# [M] Due to personal security preference, it may not work somewhere under `Users` without priviledged permissions.
cask "wetype" do
  version "0.9.9,214"
  sha256 "d67d45a5deb39c460b35e311eb8f66c45347773e2619e58616b8de251b707cb7"

  url "https://wetype.wxqcloud.qq.com/app/mac/#{version.csv.first}/WeTypeInstaller_#{version.csv.first}_#{version.csv.second}.zip"
  name "WeType"
  desc "Input method by Weixin"
  homepage "https://z.weixin.qq.com/"

  livecheck do
    skip "No reliable way to get version info"
  end

  auto_updates true
  depends_on macos: ">= :catalina"
  # installer manual: "WeTypeInstaller_#{version.csv.first}_#{version.csv.second}.app"
  container nested: "WeTypeInstaller_#{version.csv.first}_#{version.csv.second}.app/Contents/Resources/wetype.zip"

  input_method "WeType.app"

  zap trash: [
    "~/Library/Application Support/WeType",
    "~/Library/Caches/com.tencent.inputmethod.wetype",
    "~/Library/Caches/WeType",
    "~/Library/HTTPStorages/com.tencent.inputmethod.wetype",
    "~/Library/Preferences/com.tencent.inputmethod.wetype.plist",
  ]

  # uninstall delete: "/Library/Input Methods/WeType.app"

  caveats <<~EOS
    You need manually add or remove the keyboard layout under:
      Preferences → Keyboard → Input Sources → +/- → Chinese, Simplified → 微信输入法
    Add
  EOS
end
