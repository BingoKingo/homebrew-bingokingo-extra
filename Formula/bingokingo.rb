class Bingokingo < Formula
  desc "Create symlinks, shimscripts for favourites in a homebrew bin"
  homepage "https://github.com/BingoKingo/homebrew-tap/"
  url "localhost:8000/homebrew-bingokingo.hide-main.tar.gz"
  version "1"

  # system "/usr/bin/env"
  depends_on "bat"
  depends_on "bingokingo/bingokingo/miniforge-mac"
  # depends_on cask: "abbyy-finereader-pdf"
  # depends_on cask: "aegisub"
  # depends_on cask: "alex313031-thorium"
  # depends_on cask: "android-studio"
  # depends_on cask: "calibre"
  # depends_on cask: "codeedit"
  # depends_on cask: "ghidra"
  # depends_on cask: "hammerspoon"
  # depends_on cask: "intellij-idea"
  # depends_on cask: "hybras/tap/kdeconnect"
  # depends_on cask: "keepassxc"
  # depends_on cask: "launchcontrol"
  # depends_on cask: "librewolf"
  # depends_on cask: "little-snitch"
  # depends_on cask: "skim"
  # depends_on cask: "stash"
  # depends_on cask: "surge"
  # depends_on cask: "syntax-highlight"
  # depends_on cask: "unity-hub"
  # depends_on cask: "vlc"
  # depends_on cask: "vmware-fusion"
  # depends_on cask: "zoom"
  depends_on "choose-rust"
  depends_on "colordiff"
  depends_on "dog"
  depends_on "duf"
  depends_on "exa"
  depends_on "exiftool"
  depends_on "fileicon"
  depends_on "firefoxpwa"
  depends_on "glances"
  depends_on "gromgit/fuse/avfs-mac"
  depends_on "gromgit/fuse/ntfs-3g-mac"
  depends_on "gromgit/fuse/rclone-mac"
  depends_on "gromgit/fuse/simple-mtpfs-mac"
  depends_on "handbrake"
  depends_on "helix"
  depends_on "hexyl"
  depends_on "httpie"
  depends_on "macvim"
  depends_on "mas"
  depends_on "ncdu"
  depends_on "neomutt"
  depends_on "p7zip"
  depends_on "procs"
  depends_on "python"
  depends_on "ripgrep"
  depends_on "ruby"
  depends_on "transmission-cli"
  depends_on "trash"
  depends_on "zbar"
  depends_on("rustup-init") || "rust"

  def install
    # download binary
    bin.install Dir["Binary/*"]

    # path variables
    (prefix/"app").mkpath
    home = "#{HOMEBREW_DEFAULT_CACHE}/../../../"
    capp_dir = "/Applications/Homebrew Cask Applications"
    inst_dir = "/Applications/Installed Applications"
    papp_dir = "/Applications/ProApps"
    xc_apdir = "/Applications/Xcode"

    # path binary links
    bin.install_symlink Dir["#{home}/.emacs.d/bin/*"]
    bin.install_symlink Dir["#{home}/.cargo/bin/*"]
    bin.install_symlink Dir["#{home}/Library/Android/sdk/cmdline-tools/latest/bin/*"]
    rm Dir[bin/"*.{bat,dll,exe,cmd}"]

    # system binary links, from /usr/libexec/
    bin.install_symlink "/usr/libexec/airportd"
    bin.install_symlink "/usr/libexec/authopen"
    bin.install_symlink "/usr/libexec/bootpd"
    bin.install_symlink "/usr/libexec/cc_fips_test"
    bin.install_symlink "/usr/libexec/checkLocalKDC"
    bin.install_symlink "/usr/libexec/corebrightnessdiag"
    bin.install_symlink "/usr/libexec/efi-dump-logs"
    bin.install_symlink "/usr/libexec/FirmwareUpdateLauncher"
    bin.install_symlink "/usr/libexec/installer-core"
    bin.install_symlink "/usr/libexec/java_home"
    bin.install_symlink "/usr/libexec/KeychainMigrator"
    bin.install_symlink "/usr/libexec/locate.code"
    bin.install_symlink "/usr/libexec/locate.concatdb"
    bin.install_symlink "/usr/libexec/makewhatis"
    bin.install_symlink "/usr/libexec/makewhatis.local"
    bin.install_symlink "/usr/libexec/mdmclient"
    bin.install_symlink "/usr/libexec/mount_url"
    bin.install_symlink "/usr/libexec/natpmpd"
    bin.install_symlink "/usr/libexec/path_helper"
    bin.install_symlink "/usr/libexec/pcsstatus"
    bin.install_symlink "/usr/libexec/pkd"
    bin.install_symlink "/usr/libexec/PlistBuddy"
    bin.install_symlink "/usr/libexec/PlistBuddy" => "listbuddy"
    bin.install_symlink "/usr/libexec/remotectl"
    bin.install_symlink "/usr/libexec/sftp-server"
    bin.install_symlink "/usr/libexec/slapd"
    bin.install_symlink "/usr/libexec/smb-sync-preferences"
    bin.install_symlink "/usr/libexec/sshd-keygen-wrapper"
    bin.install_symlink "/usr/libexec/taskgated"
    bin.install_symlink "/usr/libexec/transparency-sysdiagnose"
    bin.install_symlink "/usr/libexec/ucupdate"
    bin.install_symlink "/usr/libexec/upsshutdown"
    bin.install_symlink "/usr/libexec/wifiFirmwareLoader"
    bin.install_symlink "/usr/libexec/x11-select"
    bin.install_symlink "/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
    # system app links
    (prefix/"app/system").mkpath
    cored ="/System/Library/CoreServices"
    ln_s "#{cored}/Applications/About This Mac.app", "#{prefix}/app/system/About This Mac.app"
    ln_s "#{cored}/Applications/Archive Utility.app", "#{prefix}/app/system/Archive Utility.app"
    ln_s "#{cored}/Applications/Desk View.app", "#{prefix}/app/system/Desk View.app"
    ln_s "#{cored}/Applications/Directory Utility.app", "#{prefix}/app/system/Directory Utility.app"
    ln_s "#{cored}/Applications/DVD Player.app", "#{prefix}/app/system/DVD Player.app"
    esu = "Expansion Slot Utility.app"
    ln_s "#{cored}/Applications/#{esu}", "#{prefix}/app/system/#{esu}"
    fas = "Folder Actions Setup.app"
    ln_s "#{cored}/Applications/#{fas}", "#{prefix}/app/system/#{fas}"
    ln_s "#{cored}/Applications/Ticket Viewer.app", "#{prefix}/app/system/Ticket Viewer.appp"
    wds = "Wireless Diagnostics.app"
    ln_s "#{cored}/Applications/#{wds}", "#{prefix}/app/system/#{wds}"
    ln_s "#{cored}/AVB Configuration.app", "#{prefix}/app/system/AVB Configuration.app"
    ln_s "#{cored}/Batteries.app", "#{prefix}/app/system/Batteries.app"
    ln_s "#{cored}/Erase Assistant.app", "#{prefix}/app/system/Erase Assistant.app"
    ln_s "#{cored}/Finder.app/Contents/Applications/AirDrop.app", "#{prefix}/app/system/AirDrop.app"
    ln_s "#{cored}/Finder.app/Contents/Applications/iCloud Drive.app", "#{prefix}/app/system/iCloud Drive.app"
    ln_s "#{cored}/Help Viewer.app", "#{prefix}/app/system/Help Viewer.app"
    ln_s "#{cored}/KeyboardSetupAssistant.app", "#{prefix}/app/system/KeyboardSetupAssistant.app"
    ln_s "#{cored}/Pro Display Calibrator.app", "#{prefix}/app/system/Pro Display Calibrator.app"
    ln_s "#{cored}/Tips.app", "#{prefix}/app/system/Tips.app"
    ln_s "#{cored}/VoiceOver.app", "#{prefix}/app/system/VoiceOver.app"
    ln_s "#{cored}/WidgetKit Simulator.app", "#{prefix}/app/system/WidgetKit Simulator.app"
    (prefix/"app/system/Add Printer.app").mkpath
    chdir (prefix/"app/system/Add Printer.app") do
      ln_s "/System/Library/CoreServices/AddPrinter.app/Contents",
"#{prefix}/app/system/Add Printer.app/Contents"
    end
    (prefix/"app/system/All My Files.app").mkpath
    chdir (prefix/"app/system/All My Files.app") do
      ln_s "/System/Library/CoreServices/Finder.app/Contents/Applications/All My Files.app/Contents",
"#{prefix}/app/system/All My Files.app/Contents"
    end
    (prefix/"app/system/Certificate Assistant.app").mkpath
    chdir (prefix/"app/system/Certificate Assistant.app") do
      ln_s "/System/Library/CoreServices/Certificate Assistant.app/Contents",
"#{prefix}/app/system/Certificate Assistant.app/Contents"
    end
    (prefix/"app/system/Computer.app").mkpath
    chdir (prefix/"app/system/Computer.app") do
      ln_s "/System/Library/CoreServices/Finder.app/Contents/Applications/Computer.app/Contents",
"#{prefix}/app/system/Computer.app/Contents"
    end
    (prefix/"app/system/Display Calibrator.app").mkpath
    chdir (prefix/"app/system/Display Calibrator.app") do
      ln_s "/System/Library/ColorSync/Calibrators/Display Calibrator.app/Contents",
"#{prefix}/app/system/Display Calibrator.app/Contents"
    end
    (prefix/"app/system/Network.app").mkpath
    chdir (prefix/"app/system/Network.app") do
      ln_s "/System/Library/CoreServices/Finder.app/Contents/Applications/Network.app/Contents",
"#{prefix}/app/system/Network.app/Contents"
    end
    (prefix/"app/system/Paired Devices.app").mkpath
    chdir (prefix/"app/system/Paired Devices.app") do
      ln_s "/System/Library/CoreServices/Paired Devices.app/Contents",
"#{prefix}/app/system/Paired Devices.app/Contents"
    end
    (prefix/"app/system/Recents.app").mkpath
    chdir (prefix/"app/system/Recents.app") do
      ln_s "/System/Library/CoreServices/Finder.app/Contents/Applications/Recents.app/Contents",
"#{prefix}/app/system/Recents.app/Contents"
    end
    (prefix/"app/system/Screen Saver.app").mkpath
    chdir (prefix/"app/system/Screen Saver.app") do
      ln_s "/System/Library/CoreServices/ScreenSaverEngine.app/Contents",
"#{prefix}/app/system/Screen Saver.app/Contents"
    end
    (prefix/"app/system/Software Update.app").mkpath
    chdir (prefix/"app/system/Software Update.app") do
      ln_s "/System/Library/CoreServices/Software Update.app/Contents",
"#{prefix}/app/system/Software Update.app/Contents"
    end
    (prefix/"app/system/Stage Manager.app").mkpath
    chdir (prefix/"app/system/Stage Manager.app") do
      ln_s "/System/Library/CoreServices/StageManagerOnboarding.app/Contents",
"#{prefix}/app/system/Stage Manager.app/Contents"
    end
    (prefix/"app/system/Summary Service.app").mkpath
    chdir (prefix/"app/system/Summary Service.app") do
      ln_s "/System/Library/Services/Summary Service.app/Contents",
"#{prefix}/app/system/Summary Service.app/Contents"
    end
    (prefix/"app/system/Wish.app").mkpath
    chdir (prefix/"app/system/Wish.app") do
      ln_s "/System/Library/Frameworks/Tk.framework/Versions/8.5/Resources/Wish.app/Contents",
"#{prefix}/app/system/Wish.app/Contents"
    end

    # xcode binary links, from /Applications/Xcode/Xcode.app/Contents/Developer/usr/bin/
    xcd = "#{xc_apdir}/Xcode.app/Contents"
    bin.install_symlink "#{xcd}/Developer/usr/bin/altool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/amlint"
    bin.install_symlink "#{xcd}/Developer/usr/bin/backgroundassets-debug"
    bin.install_symlink "#{xcd}/Developer/usr/bin/bitcode-build-tool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/cktool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/compileSceneKitShaders"
    bin.install_symlink "#{xcd}/Developer/usr/bin/coremlc"
    bin.install_symlink "#{xcd}/Developer/usr/bin/crashlog"
    bin.install_symlink "#{xcd}/Developer/usr/bin/devicectl"
    bin.install_symlink "#{xcd}/Developer/usr/bin/extractLocStrings"
    bin.install_symlink "#{xcd}/Developer/usr/bin/gamepolicyctl"
    bin.install_symlink "#{xcd}/Developer/usr/bin/ipatool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/iphoneos-optimize"
    bin.install_symlink "#{xcd}/Developer/usr/bin/logdump"
    bin.install_symlink "#{xcd}/Developer/usr/bin/mapc"
    bin.install_symlink "#{xcd}/Developer/usr/bin/momc"
    bin.install_symlink "#{xcd}/Developer/usr/bin/notarytool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/placeholderutil"
    bin.install_symlink "#{xcd}/Developer/usr/bin/pngcrush" => "pngcrush-ios"
    bin.install_symlink "#{xcd}/Developer/usr/bin/rctool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/scntool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/simctl"
    bin.install_symlink "#{xcd}/Developer/usr/bin/ssu-cli"
    bin.install_symlink "#{xcd}/Developer/usr/bin/ssu-cli-app"
    bin.install_symlink "#{xcd}/Developer/usr/bin/ssu-cli-nlu"
    bin.install_symlink "#{xcd}/Developer/usr/bin/TextureAtlas"
    bin.install_symlink "#{xcd}/Developer/usr/bin/TextureConverter"
    bin.install_symlink "#{xcd}/Developer/usr/bin/xarsigner"
    bin.install_symlink "#{xcd}/Developer/usr/bin/xccov"
    bin.install_symlink "#{xcd}/Developer/usr/bin/xcdevice"
    bin.install_symlink "#{xcd}/Developer/usr/bin/xcindex-test"
    bin.install_symlink "#{xcd}/Developer/usr/bin/xcresulttool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/xcsigningtool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/xcstringstool"
    bin.install_symlink "#{xcd}/Developer/usr/bin/xctest"
    # xcode additional binary link
    xcatld = "#{home}/Library/Application Support/MyExecutables/Xcode Additional Tools"
    bin.install_symlink "#{xcatld}/Graphics/OpenGL Driver Monitor.app/Contents/MacOS/gldrvmond"
    bin.install_symlink "#{xcatld}/Graphics/OpenGL Driver Monitor.app/Contents/MacOS/gmdlauncher"
    bin.install_symlink "#{xcatld}/Graphics/OpenGL Profiler.app/Contents/MacOS/ardbgd"
    bin.install_symlink "#{xcatld}/Graphics/Quartz Debug.app/Contents/MacOS/Server" => "QuartzDebugServer"
    bin.install_symlink "#{xcatld}/Hardware/Printer Simulator.app/Contents/MacOS/PrinterSimulatorServer"
    bin.install_symlink "#{xcatld}/Utilities/64BitConversion/CoderFormatVerifier"
    bin.install_symlink "#{xcatld}/Utilities/64BitConversion/ConvertCocoa64"
    xcodedictkit = "#{xcatld}/Utilities/Dictionary Development Kit/bin"
    bin.install_symlink "#{xcodedictkit}/add_body_record" => "dict_abodyrec"
    bin.install_symlink "#{xcodedictkit}/add_key_index_record" => "dict_akeyindexrec"
    bin.install_symlink "#{xcodedictkit}/add_reference_index_record" => "dict_arfindexrec"
    bin.install_symlink "#{xcodedictkit}/build_dict.sh" => "dict_build"
    bin.install_symlink "#{xcodedictkit}/build_key_index" => "dict_buildkeyindex"
    bin.install_symlink "#{xcodedictkit}/build_reference_index" => "dict_buildrfindex"
    bin.install_symlink "#{xcodedictkit}/extract_front_matter_id.pl" => "dict_extract_front_matter_id"
    bin.install_symlink "#{xcodedictkit}/extract_index.pl" => "dict_extract_index"
    bin.install_symlink "#{xcodedictkit}/extract_referred_id.pl" => "dict_extract_referred_id"
    bin.install_symlink "#{xcodedictkit}/generate_dict_template.sh" => "dict_template"
    bin.install_symlink "#{xcodedictkit}/make_body.pl" => "dict_mkbody"
    bin.install_symlink "#{xcodedictkit}/make_dict_package" => "dict_mkpkg"
    bin.install_symlink "#{xcodedictkit}/make_line.pl" => "dict_mkline"
    bin.install_symlink "#{xcodedictkit}/make_readonly.pl" => "dict_mkreadonly"
    bin.install_symlink "#{xcodedictkit}/normalize_key_text" => "dict_normalize_key_text"
    bin.install_symlink "#{xcodedictkit}/normalize_key_text.pl" => "dict_normalize_key_text.pl"
    bin.install_symlink "#{xcodedictkit}/pick_referred_entry_id.pl" => "dict_pick_referred_entry_id"
    bin.install_symlink "#{xcodedictkit}/remove_duplicate_key.pl" => "dict_remove_duplicate_key"
    bin.install_symlink "#{xcodedictkit}/replace_entryid_bodyid.pl" => "dict_replace_entryid_bodyid"
    # xcode app links
    (prefix/"app/xcode").mkpath
    acsp = "Accessibility Inspector.app"
    ln_s "#{xcd}/Applications/#{acsp}", "#{prefix}/app/xcode/#{acsp}"
    ln_s "#{xcd}/Applications/Create ML.app", "#{prefix}/app/xcode/Create ML.app"
    ln_s "#{xcd}/Applications/FileMerge.app", "#{prefix}/app/xcode/FileMerge.app"
    ln_s "#{xcd}/Applications/Instruments.app", "#{prefix}/app/xcode/Instruments.app"
    ln_s "#{xcd}/Developer/Applications/Simulator.app", "#{prefix}/app/xcode/Simulator.app"
    # xcode additional app links
    # xsb = "Xcode Server Builder.app"
    # ln_s "#{xcd}/Developer/Applications/#{xsb}", "#{prefix}/app/xcode/#{xsb}"
    ln_s "#{xcatld}/Hardware/CarPlay Simulator.app", "#{prefix}/app/xcode/CarPlay Simulator.app"
    ln_s "#{xcatld}/Hardware/IORegistryExplorer.app", "#{prefix}/app/xcode/IORegistryExplorer.app"
    ln_s "#{xcatld}/Hardware/PacketLogger.app", "#{prefix}/app/xcode/PacketLogger.app"

    # android sdk binary links, from /Users/shender/Library/Android/sdk
    bin.install_symlink "#{home}/Library/Android/sdk/platform-tools/adb"
    bin.install_symlink "#{home}/Library/Android/sdk/platform-tools/dmtracedump"
    bin.install_symlink "#{home}/Library/Android/sdk/platform-tools/etc1tool"
    bin.install_symlink "#{home}/Library/Android/sdk/platform-tools/fastboot"
    bin.install_symlink "#{home}/Library/Android/sdk/platform-tools/hprof-conv"
    bin.install_symlink "#{home}/Library/Android/sdk/platform-tools/make_f2fs"
    bin.install_symlink "#{home}/Library/Android/sdk/platform-tools/make_f2fs_casefold"
    bin.install_symlink "#{home}/Library/Android/sdk/platform-tools/mke2fs"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/bin64/e2fsck"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/bin64/resize2fs"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/bin64/tune2fs"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/crashpad_handler"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/emulator"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/emulator-check"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/mksdcard"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/nimble_bridge"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/qsn"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/qemu/darwin-aarch64/qemu-system-aarch64-headless"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/qemu/darwin-aarch64/qemu-system-armel"
    bin.install_symlink "#{home}/Library/Android/sdk/emulator/qemu/darwin-aarch64/qemu-system-armel-headless"
    android_build_tools_version = "33.0.2-2"
    android_ndk_version = "25.2.9519653"
    bin.install_symlink "#{home}/Library/Android/sdk/build-tools/#{android_build_tools_version}/aapt"
    bin.install_symlink "#{home}/Library/Android/sdk/build-tools/#{android_build_tools_version}/aapt2"
    bin.install_symlink "#{home}/Library/Android/sdk/build-tools/#{android_build_tools_version}/aidl"
    bin.install_symlink "#{home}/Library/Android/sdk/build-tools/#{android_build_tools_version}/apksigner"
    bin.install_symlink "#{home}/Library/Android/sdk/build-tools/#{android_build_tools_version}/d8"
    bin.install_symlink "#{home}/Library/Android/sdk/build-tools/#{android_build_tools_version}/dexdump"
    bin.install_symlink "#{home}/Library/Android/sdk/build-tools/#{android_build_tools_version}/split-select"
    bin.install_symlink "#{home}/Library/Android/sdk/build-tools/#{android_build_tools_version}/zipalign"
    bin.install_symlink "#{home}/Library/Android/sdk/ndk/#{android_ndk_version}/ndk-build"
    bin.install_symlink "#{home}/Library/Android/sdk/ndk/#{android_ndk_version}/ndk-gdb"
    bin.install_symlink "#{home}/Library/Android/sdk/ndk/#{android_ndk_version}/ndk-lldb"
    bin.install_symlink "#{home}/Library/Android/sdk/ndk/#{android_ndk_version}/ndk-stack"
    bin.install_symlink "#{home}/Library/Android/sdk/ndk/#{android_ndk_version}/ndk-which"

    # homebrew binary links
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/7z" => "7-zip"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/7z" => "7zip"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/adbe" => "adb."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/avfsd" => "avfs"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/bat" => "cat."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/choose" => "cut."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/dog" => "dig."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/duf" => "df."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/exa" => "ls."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/exiftool" => "exif"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/firefoxpwa" => "librewolfpwa"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/glances" => "top."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/ghidraRun" => "ghidra"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/HandBrakeCLI" => "handbrake"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/hexyl" => "hexview"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/httpie" => "curl."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/hs" => "hammerspoon"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/hx" => "helix"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/kdeconnect-cli" => "kdeconnect"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/keepassxc-cli" => "keepassxc"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/lowntfs-3g" => "lowntfs"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/ncdu" => "du."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/neomutt" => "mutt"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/ntfs-3g" => "ntfs"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/ntfs-3g.probe" => "ntfs.probe"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/procs" => "ps."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/rclone-mac" => "rclone"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/rg" => "rgrep"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/rg" => "ripgrep"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/simple-mtpfs" => "mtpfs"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/transmission-remote" => "transmission"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/trash" => "rm."
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/vlc" => "cvlc"
    bin.install_symlink "#{HOMEBREW_PREFIX}/bin/zbarimg" => "zbar"
    bin.install_symlink "#{HOMEBREW_PREFIX}/opt/miniforge-mac/bin/conda"
    bin.install_symlink "#{HOMEBREW_PREFIX}/opt/ruby/bin/gem"
    # homebrew cask binary links
    bin.install_symlink "#{capp_dir}/Barrier.app/Contents/MacOS/barrierc"
    bin.install_symlink "#{capp_dir}/Barrier.app/Contents/MacOS/barriers"
    bin.install_symlink "#{capp_dir}/CodeEdit.app/Contents/MacOS/CodeEdit"
    bin.install_symlink "#{capp_dir}/IntelliJ IDEA.app/Contents/bin/fsnotifier" => "idea-fsnotifier"
    bin.install_symlink "#{capp_dir}/IntelliJ IDEA.app/Contents/bin/repair" => "idea-repair"
    bin.install_symlink "#{capp_dir}/Surge.app/Contents/Applications/surge-cli"
    bin.install_symlink "#{capp_dir}/Surge.app/Contents/Applications/surge-cli" => "surge"
    bin.install_symlink "#{capp_dir}/Surge.app/Contents/Applications/surge-dhcpd"
    bin.install_symlink "#{capp_dir}/Surge.app/Contents/Applications/surge-dhcpd-legacy"
    bin.install_symlink "#{capp_dir}/Syntax Highlight.app/Contents/Resources/syntax_highlight_cli" => "colorize"
    bin.install_symlink "/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"
    bin.install_symlink "/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli" => 'karabiner'
    # homebrew cask links
    (prefix/"app/cask").mkpath
    ln_s "#{capp_dir}/Stash.app/Contents/Applications/Stash Dashboard.app", "#{prefix}/app/cask/Stash Dashboard.app"
    ln_s "#{capp_dir}/Surge.app/Contents/Applications/Surge Dashboard.app", "#{prefix}/app/cask/Surge Dashboard.app"
    ln_s "#{capp_dir}/VMware Fusion.app/Contents/Library/VMware Fusion Applications Menu.app",
"#{prefix}/app/cask/VMware Fusion Applications Menu.app"
    ln_s "#{capp_dir}/calibre.app/Contents/ebook-viewer.app", "#{prefix}/app/cask/calibre-viewer.app"
    ln_s "#{capp_dir}/calibre.app/Contents/ebook-viewer.app/Contents/ebook-edit.app",
"#{prefix}/app/cask/calibre-edit.app"
    ln_s "/Applications/zoom.us.app/Contents/Frameworks/airhost.app", "#{prefix}/app/cask/ZoomAirhost.app"
    ln_s "/Applications/zoom.us.app/Contents/Frameworks/ZMScreenshot.app", "#{prefix}/app/cask/ZoomScreenshot.app"
    ln_s "/Applications/zoom.us.app/Contents/Frameworks/ZoomClips.app", "#{prefix}/app/cask/ZoomClips.app"
    lcqld = "#{capp_dir}/LaunchControl.app/Contents/Library/LoginItems"
    ln_s "#{lcqld}/QuickLaunch.app", "#{prefix}/app/cask/QuickLaunch.app"
    ltscd = "/Applications/Little Snitch.app/Contents/Components"
    ln_s "#{ltscd}/Little Snitch Network Monitor.app", "#{prefix}/app/cask/Little Snitch Network Monitor.app"
    abbyyd = "#{capp_dir}/ABBYY FineReader PDF.app/Contents/MacOS"
    ln_s "#{abbyyd}/ABBYY FineReader PDF Viewer.app", "#{prefix}/app/cask/ABBYY FineReader PDF Viewer.app"
    unity_version = "2021.3.18f1"
    unityd = "#{home}/Library/Application Support/Unity/Application/#{unity_version}/"
    ln_s "#{unityd}/Unity.app", "#{prefix}/app/cask/Unity.app"
    ln_s "#{unityd}/Unity Bug Reporter.app", "#{prefix}/app/cask/Unity Bug Reporter.app"
    # cannot use absolute path in symlinks
    # ln_s "#{opt_prefix}/../macvim/MacVim.app", "#{prefix}/app/cask/MacVim.app"
    # pyd = "#{opt_prefix}/../python/"
    # ln_s "#{pyd}/Python Launcher 3.app", "#{prefix}/app/cask/Python Launcher 3.app"

    # homebrew cask shimscript links
    File.write "#{bin}/aegisub", <<~EOS
      #!/bin/bash
      exec "#{capp_dir}/Aegisub.app/Contents/MacOS/aegisub" "$@"
    EOS

    File.write "#{bin}/studio", <<~EOS
      #!/bin/bash
      # Generated by JetBrains Toolbox 2.0.5.17700
      declare -a intellij_args=()
      declare -- wait=""
      for o in "$@"; do
        if [[ "$o" = "--wait" || "$o" = "-w" ]]; then
          wait="-W"
          o="--wait"
        fi
        if [[ "$o" =~ " " ]]; then
          intellij_args+=("\"$o\"")
        else
          intellij_args+=("$o")
        fi
      done
      open -na "#{capp_dir}/Android Studio.app/Contents/MacOS/studio" $wait --args "${intellij_args[@]}"
    EOS
    bin.install_symlink "#{bin}/studio" => "astudio"

    File.write "#{bin}/idea", <<~EOS
      #!/bin/bash
      # Generated by JetBrains Toolbox 2.0.5.17700
      declare -a intellij_args=()
      declare -- wait=""
      for o in "$@"; do
        if [[ "$o" = "--wait" || "$o" = "-w" ]]; then
          wait="-W"
          o="--wait"
        fi
        if [[ "$o" =~ " " ]]; then
          intellij_args+=("\"$o\"")
        else
          intellij_args+=("$o")
        fi
      done
      open -na "#{capp_dir}/IntelliJ IDEA.app/Contents/MacOS/idea" $wait --args "${intellij_args[@]}"
    EOS

    File.write "#{bin}/skimview", <<~EOS
      #!/bin/bash
      exec "#{capp_dir}/Skim.app/Contents/MacOS/Skim" "$@"
    EOS

    File.write "#{bin}/librewolf-p", <<~EOS
      #!/bin/bash
      exec "#{capp_dir}/LibreWolf.app/Contents/MacOS/librewolf" "-private-window" "$@"
    EOS

    File.write "#{bin}/Thorium-p", <<~EOS
      #!/bin/bash
      exec "#{capp_dir}/Thorium.app/Contents/MacOS/Thorium" "-incognito" "$@"
    EOS

    # favourite script links
    File.write "#{bin}/allow", <<~EOS
      #!/bin/bash
      exec "xattr" "-dr" "com.apple.quarantine" "$@"
    EOS

    File.write "#{bin}/cp.", <<~EOS
      #!/bin/bash
      exec "cp" "-iv" "$@"
    EOS

    File.write "#{bin}/lock", <<~EOS
      #!/bin/bash
      for i in "$@";
          do if [ -d "$i" ] ; then
              if [ "$(ls -dlO "$i" | grep schg,uchg)" == "" ]; then
                  sudo chflags uchg "$i" && sudo chflags schg "$i"
              else
                  sudo chflags nouchg "$i" && sudo chflags noschg "$i"
              fi;
          elif [ -f "$i" ]; then
              if [ "$(ls -lO "$i" | grep schg,uchg)" == "" ]; then
                  sudo chflags uchg "$i" && sudo chflags schg "$i"
              else
                  sudo chflags nouchg "$i" && sudo chflags noschg "$i"
              fi;
          else
              exit 1
          fi;
      done
    EOS

    File.write "#{bin}/mas-id", <<~EOS
      #!/bin/bash
      mas list | grep $1 | grep -oE '^\S+'
    EOS

    File.write "#{bin}/mv.", <<~EOS
      #!/bin/bash
      exec "mv" "-iv" "$@"
    EOS

    File.write "#{bin}/pldiff", <<~EOS
    #!/bin/bash
    ## Compares plist files line by line, requires colordiff, original: https://github.com/scottrigby/pldiff
    ## @see https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man5/plist.5.html
    ## @see http://stackoverflow.com/questions/9485713/editor-or-way-to-print-plist-in-a-clean-way-without-xcode
    ## @see http://stackoverflow.com/questions/13437104/compare-content-of-two-variables-in-bash
    ## @see http://stackoverflow.com/questions/4857310/how-to-get-diff-working-like-git-diff
    a=$(plutil -convert xml1 -o - "$1")
    b=$(plutil -convert xml1 -o - "$2")
    # The -u flag displays line numbers with "+" and "-" (rather than ">" and "<").
    # The optional colordiff binary defaults to green/red.
    # Less -R is used to emulate vi.
    which colordiff &> /dev/null
      if [ $? == 0 ]; then
        diff -u <(echo "$a") <(echo "$b") "${@:3}" | colordiff | less -R
      else
        diff -u <(echo "$a") <(echo "$b") "${@:3}" | less -R
      fi
    EOS

    File.write "#{bin}/plgitdiff", <<~EOS
      #!/bin/bash
      ## Shows git diff of tracked plist files, original: https://github.com/scottrigby/plgitdiff
      ## @see http://confusatory.org/post/133141617492/git-diff-for-binary-apple-property-list-files
      ## Usage:
      ## *plgitdiff* [options] [<commit>] [--] [<path>...]
      ## *plgitdiff* [options] --cached [<commit>] [--] [<path>...]
      ## *plgitdiff* [options] <commit> <commit> [--] [<path>...]
      ## *plgitdiff* [options] <blob> <blob>
      ## *plgitdiff* [options] [--no-index] [--] <path> <path>
      # Ensure we are in a git directory, because this command doesn't make sense otherwise.
      status=$(git status 2> /dev/null)
      if [ $? == 128 ]; then
        echo 'You are not in a git working tree.'
        exit 1
      fi
      # We set matching git config and attributes within the current project only, so that we can easily cleanup afterwards.
      git config diff.plist.textconv "plutil -convert xml1 -o -"
      echo "*.plist diff=plist" >> .gitattributes
      # Check that this worked with:
      # git config --get diff.plist.textconv && cat .gitattributes
      # Accept any args for git diff. Also, --color will preserve diff colors on output.
      diff=$(git diff --color "$@")
      echo "$diff"
      # Clean up our git config and attributes, to be good citizens.
      git config --remove-section diff.plist
      sed -i '' '/*.plist diff=plist/d' .gitattributes
      git ls-files .gitattributes --error-unmatch &> /dev/null
      if [ $? == 1 ]; then
        # The file is not tracked by git.
        [[ $(tr -d "\r\n" < .gitattributes|wc -c) -eq 0 ]]
        if [ $? == 0 ]; then
          echo 'empty'
          # If local git attributes file is not tracked by git, and now empty, remove
          # it.
          rm .gitattributes
        fi
      fi
    EOS

    File.write "#{bin}/v", <<~EOS
      #!/bin/bash
      exec "ls" "-ablO" "$@"
    EOS

    File.write "#{bin}/bingokingo", <<~EOS
      #!/bin/bash
      # if [[ $# -eq 0 ]]; then
      #     echo "Press a following key to continue."
      #     echo "i) set \033[1mi\033[0mcons for apps and folders"
      #     echo "l) sym\033[1ml\033[0mink apps"
      #     echo "u) check \033[1mu\033[0mpdates"
      #     read -rsn 1 arg
      # else
      #     for arg in "$@"; do
      #         case $arg in
                  # -l | -L)
                      ln -sf '#{HOMEBREW_PREFIX}/opt/macvim/MacVim.app' '#{capp_dir}/';
                      ln -sf '#{HOMEBREW_PREFIX}/opt/python/Python Launcher 3.app' '#{capp_dir}/';
                      (cp -a '#{prefix}/app/cask/'* '#{capp_dir}/'; rmdir '#{prefix}/app/cask/';
                      sudo cp -a '#{prefix}/app/system/'* '/Applications/Utilities/'; rmdir '#{prefix}/app/system/';
                      cp -a '#{prefix}/app/xcode/'* '#{xc_apdir}/'; rmdir '#{prefix}/app/xcode/';
                      cp -a '#{prefix}/app/papp/'* '#{papp_dir}/'; rmdir '#{prefix}/app/papp/';
                      # cp -a '#{prefix}/app/inst/'* '#{inst_dir}/'; rmdir '#{prefix}/app/inst/';
                      rmdir '#{prefix}/app/') > /dev/null 2>&1
                  # ;;
                  # -i | -I)
                      # folder
                      (fileicon set "/Applications/Adobe" "#{prefix}/icon/folder/Adobe.icns";
                      fileicon set "/Applications/Blackmagic" "#{prefix}/icon/folder/Blackmagic.icns";
                      fileicon set "/Applications/ProApps" "#{prefix}/icon/folder/ProApps.icns";
                      fileicon set "/Applications/Xcode" "#{prefix}/icon/folder/Xcode.icns") > /dev/null 2>&1
                      # app
                      (fileicon set "#{capp_dir}/A Better Finder Rename 11.app" "#{prefix}/icon/app/A Better Finder Rename 11.app.icns";
                      fileicon set "#{capp_dir}/Aegisub.app" "#{prefix}/icon/app/Aegisub.app.icns";
                      fileicon set "#{capp_dir}/AltTab.app" "#{prefix}/icon/app/AltTab.app.icns";
                      fileicon set "#{capp_dir}/Android Studio.app" "#{prefix}/icon/app/Android Studio.app.icns";
                      fileicon set "#{capp_dir}/Barrier.app" "#{prefix}/icon/app/Barrier.app.icns";
                      fileicon set "#{capp_dir}/BetterZip.app" "#{prefix}/icon/app/BetterZip.app.icns";
                      fileicon set "#{capp_dir}/Blender.app" "#{prefix}/icon/app/Blender.app.icns";
                      fileicon set "#{capp_dir}/calibre.app" "#{prefix}/icon/app/calibre.app.icns";
                      fileicon set "#{capp_dir}/calibre.app/Contents/ebook-viewer.app" "#{prefix}/icon/app/ebook-viewer.app.icns";
                      fileicon set "#{capp_dir}/calibre.app/Contents/ebook-viewer.app/Contents/ebook-edit.app" "#{prefix}/icon/app/ebook-edit.app.icns";
                      fileicon set "#{capp_dir}/Capture One 23.app" "#{prefix}/icon/app/Capture One 23.app.icns";
                      fileicon set "#{capp_dir}/Charles.app" "#{prefix}/icon/app/Charles.app.icns";
                      fileicon set "#{capp_dir}/Electron.app" "#{prefix}/icon/app/Electron.app.icns";
                      fileicon set "#{capp_dir}/figmaFileDownloader.app" "#{prefix}/icon/app/figmaFileDownloader.app.icns";
                      fileicon set "#{capp_dir}/Font Finagler.app" "#{prefix}/icon/app/Font Finagler.app.icns";
                      fileicon set "#{capp_dir}/Flux.app" "#{prefix}/icon/app/Flux.app.icns";
                      fileicon set "#{capp_dir}/Gemini 2.app" "#{prefix}/icon/app/Gemini 2.app.icns";
                      fileicon set "#{capp_dir}/HandBrake.app" "#{prefix}/icon/app/HandBrake.app.icns";
                      fileicon set "#{capp_dir}/HRSWord.app" "#{prefix}/icon/app/HRSWord.app.icns";
                      fileicon set "#{capp_dir}/IntelliJ IDEA.app" "#{prefix}/icon/app/IntelliJ IDEA.app.icns";
                      fileicon set "#{capp_dir}/KDE Connect.app" "#{prefix}/icon/app/KDE Connect.app.icns";
                      fileicon set "#{capp_dir}/LibreWolf.app" "#{prefix}/icon/app/LibreWolf.app.icns";
                      fileicon set "#{capp_dir}/LICEcap.app" "#{prefix}/icon/app/LICEcap.app.icns";
                      fileicon set "#{capp_dir}/LinkedIdeas.app" "#{prefix}/icon/app/LinkedIdeas.app.icns";
                      fileicon set "#{capp_dir}/Muzzle.app" "#{prefix}/icon/app/Muzzle.app.icns";
                      fileicon set "#{capp_dir}/OpenGithub.app" "#{prefix}/icon/app/OpenGithub.app.icns";
                      fileicon set "#{capp_dir}/Orion.app" "#{prefix}/icon/app/Orion.app.icns";
                      fileicon set "#{capp_dir}/PlistEdit Pro.app" "#{prefix}/icon/app/PlistEdit Pro.app.icns";
                      fileicon set "#{capp_dir}/Raycast.app" "#{prefix}/icon/app/Raycast.app.icns";
                      fileicon set "#{capp_dir}/Rclone Browser.app" "#{prefix}/icon/app/Rclone Browser.app.icns";
                      fileicon set "#{capp_dir}/Sideloadly.app" "#{prefix}/icon/app/Sideloadly.app.icns";
                      fileicon set "#{capp_dir}/ThemeEngine.app" "#{prefix}/icon/app/ThemeEngine.app.icns";
                      fileicon set "#{capp_dir}/Thorium.app" "#{prefix}/icon/app/Thorium.app.icns";
                      fileicon set "#{capp_dir}/UninstallPKG.app" "#{prefix}/icon/app/UninstallPKG.app.icns";
                      fileicon set "#{capp_dir}/Unity Hub.app" "#{prefix}/icon/app/Unity Hub.app.icns";
                      fileicon set "#{capp_dir}/VLC.app" "#{prefix}/icon/app/VLC.app.icns";
                      fileicon set "#{HOMEBREW_PREFIX}/opt/python/Python Launcher 3.app" "#{prefix}/icon/app/Python Launcher 3.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Audio/AU Lab.app" "#{prefix}/icon/app/AU Lab.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Audio/HALLab.app" "#{prefix}/icon/app/HALLab.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Graphics/OpenGL Driver Monitor.app" "#{prefix}/icon/app/OpenGL Driver Monitor.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Graphics/OpenGL Profiler.app" "#{prefix}/icon/app/OpenGL Profiler.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Graphics/Pixie.app" "#{prefix}/icon/app/Pixie.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Graphics/Quartz Debug.app" "#{prefix}/icon/app/Quartz Debug.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Hardware/HomeKit Accessory Simulator.app" "#{prefix}/icon/app/HomeKit Accessory Simulator.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Hardware/IORegistryExplorer.app" "#{prefix}/icon/app/IORegistryExplorer.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Hardware/Printer Simulator.app" "#{prefix}/icon/app/Printer Simulator.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Utilities/Clipboard Viewer.app" "#{prefix}/icon/app/Clipboard Viewer.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Utilities/CrashReporterPrefs.app" "#{prefix}/icon/app/CrashReporterPrefs.app.icns";
                      fileicon set "#{xc_apdir}/Additional Tools/Utilities/Help Indexer.app" "#{prefix}/icon/app/Help Indexer.app.icns";
                      fileicon set "/Applications/DeskDockServer.app" "#{prefix}/icon/app/DeskDockServer.app.icns";
                      fileicon set "/Applications/NeoOffice.app" "#{prefix}/icon/app/NeoOffice.app.icns";
                      sudo fileicon set "#{capp_dir}/VMware Fusion.app/Contents/Library/VMware Fusion Applications Menu.app" "#{prefix}/icon/app/VMware Fusion Applications Menu.app.icns";
                      sudo fileicon set "/Applications/3d Scanner App.app" "#{prefix}/icon/app/3d Scanner App.app.icns";
                      sudo fileicon set "/Applications/AmorphousDiskMark.app" "#{prefix}/icon/app/AmorphousDiskMark.app.icns";
                      sudo fileicon set "/Applications/Background Music.app" "#{prefix}/icon/app/Background Music.app.icns";
                      sudo fileicon set "/Applications/Blackmagic/Blackmagic RAW Player.app" "#{prefix}/icon/app/Blackmagic RAW Player.app.icns";
                      sudo fileicon set "/Applications/Blackmagic/Blackmagic RAW Speed Test.app" "#{prefix}/icon/app/Blackmagic RAW Speed Test.app.icns";
                      sudo fileicon set "/Applications/Cleaner for Xcode.app" "#{prefix}/icon/app/Cleaner for Xcode.app.icns";
                      sudo fileicon set "/Applications/FBX Review.app" "#{prefix}/icon/app/FBX Review.app.icns";
                      sudo fileicon set "/Applications/Glance.app" "#{prefix}/icon/app/Glance.app.icns";
                      sudo fileicon set "/Applications/HazeOver.app" "#{prefix}/icon/app/HazeOver.app.icns";
                      sudo fileicon set "/Applications/Hidden Bar.app" "#{prefix}/icon/app/Hidden Bar.app.icns";
                      sudo fileicon set "/Applications/ImageFinder for Safari.app" "#{prefix}/icon/app/ImageFinder for Safari.app.icns";
                      sudo fileicon set "/Applications/IriunWebcam.app" "#{prefix}/icon/app/IriunWebcam.app.icns";
                      sudo fileicon set "/Applications/Jump Desktop Connect.app" "#{prefix}/icon/app/Jump Desktop Connect.app.icns";
                      sudo fileicon set "/Applications/Karabiner-Elements.app" "#{prefix}/icon/app/Karabiner-Elements.app.icns";
                      sudo fileicon set "/Applications/Karabiner-EventViewer.app" "#{prefix}/icon/app/Karabiner-EventViewer.app.icns";
                      sudo fileicon set "/Applications/Keynote.app" "#{prefix}/icon/app/Keynote.app.icns";
                      sudo fileicon set "/Applications/KeyPad.app" "#{prefix}/icon/app/KeyPad.app.icns";
                      sudo fileicon set "/Applications/LanguageTranslator.app" "#{prefix}/icon/app/LanguageTranslator.app.icns";
                      sudo fileicon set "/Applications/LimeChat.app" "#{prefix}/icon/app/LimeChat.app.icns";
                      sudo fileicon set "/Applications/Little Snitch.app" "#{prefix}/icon/app/Little Snitch.app.icns";
                      sudo fileicon set "/Applications/Minesweeper.app" "#{prefix}/icon/app/Minesweeper.app.icns";
                      sudo fileicon set "/Applications/Numbers.app" "#{prefix}/icon/app/Numbers.app.icns";
                      sudo fileicon set "/Applications/Pages.app" "#{prefix}/icon/app/Pages.app.icns";
                      sudo fileicon set "/Applications/Parallels Desktop.app/Contents/MacOS/Parallels Mac VM.app" "#{prefix}/icon/app/Parallels Mac VM.app.icns";
                      sudo fileicon set "/Applications/PowerShell.app" "#{prefix}/icon/app/PowerShell.app.icns";
                      sudo fileicon set "/Applications/SingleFile for Safari.app" "#{prefix}/icon/app/SingleFile for Safari.app.icns";
                      sudo fileicon set "/Applications/The Unarchiver.app" "#{prefix}/icon/app/The Unarchiver.app.icns";
                      sudo fileicon set "/Applications/Tunnelblick.app" "#{prefix}/icon/app/Tunnelblick.app.icns";
                      sudo fileicon set "/Applications/Utilities/All My Files.app" "#{prefix}/icon/app/All My Files.app.icns";
                      sudo fileicon set "/Applications/Utilities/Add Printer.app" "#{prefix}/icon/app/Add Printer.app.icns";
                      sudo fileicon set "/Applications/Utilities/Certificate Assistant.app" "#{prefix}/icon/app/Certificate Assistant.app.icns";
                      sudo fileicon set "/Applications/Utilities/Computer.app" "#{prefix}/icon/app/Computer.app.icns";
                      sudo fileicon set "/Applications/Utilities/Display Calibrator.app" "#{prefix}/icon/app/Display Calibrator.app.icns";
                      sudo fileicon set "/Applications/Utilities/Network.app" "#{prefix}/icon/app/Network.app.icns";
                      sudo fileicon set "/Applications/Utilities/Paired Devices.app" "#{prefix}/icon/app/Paired Devices.app.icns";
                      sudo fileicon set "/Applications/Utilities/Recents.app" "#{prefix}/icon/app/Recents.app.icns";
                      sudo fileicon set "/Applications/Utilities/Screen Saver.app" "#{prefix}/icon/app/Screen Saver.app.icns";
                      sudo fileicon set "/Applications/Utilities/Software Update.app" "#{prefix}/icon/app/Software Update.app.icns";
                      sudo fileicon set "/Applications/Utilities/Stage Manager.app" "#{prefix}/icon/app/Stage Manager.app.icns";
                      sudo fileicon set "/Applications/Utilities/Summary Service.app" "#{prefix}/icon/app/Summary Service.app.icns";
                      sudo fileicon set "/Applications/Utilities/Wish.app" "#{prefix}/icon/app/Wish.app.icns";
                      sudo fileicon set "/Applications/Utilities/XQuartz.app" "#{prefix}/icon/app/XQuartz.app.icns";
                      sudo fileicon set "/Applications/VooV Meeting.app" "#{prefix}/icon/app/VooV Meeting.app.icns";
                      sudo fileicon set "/Applications/zoom.us.app/Contents/Frameworks/airhost.app" "#{prefix}/icon/app/airhost.app.icns";
                      sudo fileicon set "/Applications/zoom.us.app/Contents/Frameworks/ZMScreenshot.app" "#{prefix}/icon/app/ZMScreenshot.app.icns";
                      sudo fileicon set "/Applications/zoom.us.app/Contents/Frameworks/ZoomClips.app" "#{prefix}/icon/app/ZoomClips.app.icns";
                      sudo fileicon set "/Applications/蜘蛛纸牌.app" "#{prefix}/icon/app/蜘蛛纸牌.app.icns") > /dev/null 2>&1
                      # app-pdwin
                      (pd_windir='/Users/shender/Applications (Parallels)/{0382f53e-20b4-4338-8afb-d29fa7aae928} Applications.localized';
                      fileicon set "$pd_windir/3D Builder.app" "#{prefix}/icon/app-pdwin/3D Builder.app.icns";
                      fileicon set "$pd_windir/3D 查看器.app" "#{prefix}/icon/app-pdwin/3D 查看器.app.icns";
                      fileicon set "$pd_windir/Access.app" "#{prefix}/icon/app-pdwin/Access.app.icns";
                      fileicon set "$pd_windir/AutoCAD 2023 - 简体中文 (Simplified Chinese).app" "#{prefix}/icon/app-pdwin/AutoCAD 2023 - 简体中文 (Simplified Chinese).app.icns";
                      fileicon set "$pd_windir/CAJViewer.app" "#{prefix}/icon/app-pdwin/CAJViewer.app.icns";
                      fileicon set "$pd_windir/Clipchamp – 视频编辑器.app" "#{prefix}/icon/app-pdwin/Clipchamp – 视频编辑器.app.icns";
                      fileicon set "$pd_windir/CNKI Express [1].app" "#{prefix}/icon/app-pdwin/CNKI Express [1].app.icns";
                      fileicon set "$pd_windir/CNKI® CAJViewer 7.3.app" "#{prefix}/icon/app-pdwin/CNKI® CAJViewer 7.3.app.icns";
                      fileicon set "$pd_windir/Cortana.app" "#{prefix}/icon/app-pdwin/Cortana.app.icns";
                      fileicon set "$pd_windir/Daily Desktop Wallpaper.app" "#{prefix}/icon/app-pdwin/Daily Desktop Wallpaper.app.icns";
                      fileicon set "$pd_windir/Desktop flows.app" "#{prefix}/icon/app-pdwin/Desktop flows.app.icns";
                      fileicon set "$pd_windir/Ditto [1].app" "#{prefix}/icon/app-pdwin/Ditto [1].app.icns";
                      fileicon set "$pd_windir/Ditto.app" "#{prefix}/icon/app-pdwin/Ditto.app.icns";
                      fileicon set "$pd_windir/Excel.app" "#{prefix}/icon/app-pdwin/Excel.app.icns";
                      fileicon set "$pd_windir/Foobar2000 [1].app" "#{prefix}/icon/app-pdwin/Foobar2000 [1].app.icns";
                      fileicon set "$pd_windir/Foobar2000.app" "#{prefix}/icon/app-pdwin/Foobar2000.app.icns";
                      fileicon set "$pd_windir/Fresh Paint.app" "#{prefix}/icon/app-pdwin/Fresh Paint.app.icns";
                      fileicon set "$pd_windir/Hyper-V 快速创建.app" "#{prefix}/icon/app-pdwin/Hyper-V 快速创建.app.icns";
                      fileicon set "$pd_windir/ivySCI.app" "#{prefix}/icon/app-pdwin/ivySCI.app.icns";
                      fileicon set "$pd_windir/Jump Desktop.app" "#{prefix}/icon/app-pdwin/Jump Desktop.app.icns";
                      fileicon set "$pd_windir/MarkPad.app" "#{prefix}/icon/app-pdwin/MarkPad.app.icns";
                      fileicon set "$pd_windir/Microsoft Edge.app" "#{prefix}/icon/app-pdwin/Microsoft Edge.app.icns";
                      fileicon set "$pd_windir/Microsoft Font Maker.app" "#{prefix}/icon/app-pdwin/Microsoft Font Maker.app.icns";
                      fileicon set "$pd_windir/Microsoft Power BI.app" "#{prefix}/icon/app-pdwin/Microsoft Power BI.app.icns";
                      fileicon set "$pd_windir/Microsoft Store.app" "#{prefix}/icon/app-pdwin/Microsoft Store.app.icns";
                      fileicon set "$pd_windir/Microsoft Teams (work or school) [1].app" "#{prefix}/icon/app-pdwin/Microsoft Teams (work or school) [1].app.icns";
                      fileicon set "$pd_windir/Microsoft Teams (work or school).app" "#{prefix}/icon/app-pdwin/Microsoft Teams (work or school).app.icns";
                      fileicon set "$pd_windir/Microsoft Teams.app" "#{prefix}/icon/app-pdwin/Microsoft Teams.app.icns";
                      fileicon set "$pd_windir/Microsoft To Do.app" "#{prefix}/icon/app-pdwin/Microsoft To Do.app.icns";
                      fileicon set "$pd_windir/Microsoft Whiteboard.app" "#{prefix}/icon/app-pdwin/Microsoft Whiteboard.app.icns";
                      fileicon set "$pd_windir/Movie Maker.app" "#{prefix}/icon/app-pdwin/Movie Maker.app.icns";
                      fileicon set "$pd_windir/MSIX Packaging Tool.app" "#{prefix}/icon/app-pdwin/MSIX Packaging Tool.app.icns";
                      fileicon set "$pd_windir/Notepads.app" "#{prefix}/icon/app-pdwin/Notepads.app.icns";
                      fileicon set "$pd_windir/NVDA (No UI Access).app" "#{prefix}/icon/app-pdwin/NVDA (No UI Access).app.icns";
                      fileicon set "$pd_windir/NVDA application [1].app" "#{prefix}/icon/app-pdwin/NVDA application [1].app.icns";
                      fileicon set "$pd_windir/NVDA application.app" "#{prefix}/icon/app-pdwin/NVDA application.app.icns";
                      fileicon set "$pd_windir/NVDA.app" "#{prefix}/icon/app-pdwin/NVDA.app.icns";
                      fileicon set "$pd_windir/Office.app" "#{prefix}/icon/app-pdwin/Office.app.icns";
                      fileicon set "$pd_windir/OneDrive.app" "#{prefix}/icon/app-pdwin/OneDrive.app.icns";
                      fileicon set "$pd_windir/OneNote for Windows 10.app" "#{prefix}/icon/app-pdwin/OneNote for Windows 10.app.icns";
                      fileicon set "$pd_windir/OneNote.app" "#{prefix}/icon/app-pdwin/OneNote.app.icns";
                      fileicon set "$pd_windir/Outlook [1].app" "#{prefix}/icon/app-pdwin/Outlook [1].app.icns";
                      fileicon set "$pd_windir/Outlook [2].app" "#{prefix}/icon/app-pdwin/Outlook [2].app.icns";
                      fileicon set "$pd_windir/Outlook [3].app" "#{prefix}/icon/app-pdwin/Outlook [3].app.icns";
                      fileicon set "$pd_windir/Outlook [4].app" "#{prefix}/icon/app-pdwin/Outlook [4].app.icns";
                      fileicon set "$pd_windir/Outlook.app" "#{prefix}/icon/app-pdwin/Outlook.app.icns";
                      fileicon set "$pd_windir/Photo Gallery.app" "#{prefix}/icon/app-pdwin/Photo Gallery.app.icns";
                      fileicon set "$pd_windir/Power Automate machine runtime.app" "#{prefix}/icon/app-pdwin/Power Automate machine runtime.app.icns";
                      fileicon set "$pd_windir/Power Automate x32.app" "#{prefix}/icon/app-pdwin/Power Automate x32.app.icns";
                      fileicon set "$pd_windir/Power Automate.app" "#{prefix}/icon/app-pdwin/Power Automate.app.icns";
                      fileicon set "$pd_windir/Power BI Desktop.app" "#{prefix}/icon/app-pdwin/Power BI Desktop.app.icns";
                      fileicon set "$pd_windir/PowerPoint.app" "#{prefix}/icon/app-pdwin/PowerPoint.app.icns";
                      fileicon set "$pd_windir/Project.app" "#{prefix}/icon/app-pdwin/Project.app.icns";
                      fileicon set "$pd_windir/Publisher.app" "#{prefix}/icon/app-pdwin/Publisher.app.icns";
                      fileicon set "$pd_windir/Send to OneNote Tool.app" "#{prefix}/icon/app-pdwin/Send to OneNote Tool.app.icns";
                      fileicon set "$pd_windir/SharePoint Designer 2013.app" "#{prefix}/icon/app-pdwin/SharePoint Designer 2013.app.icns";
                      fileicon set "$pd_windir/Skype.app" "#{prefix}/icon/app-pdwin/Skype.app.icns";
                      fileicon set "$pd_windir/Sway.app" "#{prefix}/icon/app-pdwin/Sway.app.icns";
                      fileicon set "$pd_windir/Tai.app" "#{prefix}/icon/app-pdwin/Tai.app.icns";
                      fileicon set "$pd_windir/Visio.app" "#{prefix}/icon/app-pdwin/Visio.app.icns";
                      fileicon set "$pd_windir/Windows Community Toolkit Sample App.app" "#{prefix}/icon/app-pdwin/Windows Community Toolkit Sample App.app.icns";
                      fileicon set "$pd_windir/Windows Dev Center.app" "#{prefix}/icon/app-pdwin/Windows Dev Center.app.icns";
                      fileicon set "$pd_windir/Windows File Manager.app" "#{prefix}/icon/app-pdwin/Windows File Manager.app.icns";
                      fileicon set "$pd_windir/Windows File Recovery.app" "#{prefix}/icon/app-pdwin/Windows File Recovery.app.icns";
                      fileicon set "$pd_windir/Windows Live Messenger.app" "#{prefix}/icon/app-pdwin/Windows Live Messenger.app.icns";
                      fileicon set "$pd_windir/Windows Sandbox.app" "#{prefix}/icon/app-pdwin/Windows Sandbox.app.icns";
                      fileicon set "$pd_windir/Windows 安全中心.app" "#{prefix}/icon/app-pdwin/Windows 安全中心.app.icns";
                      fileicon set "$pd_windir/Word.app" "#{prefix}/icon/app-pdwin/Word.app.icns";
                      fileicon set "$pd_windir/Xbox Game Bar.app" "#{prefix}/icon/app-pdwin/Xbox Game Bar.app.icns";
                      fileicon set "$pd_windir/Xbox 原创虚拟形象.app" "#{prefix}/icon/app-pdwin/Xbox 原创虚拟形象.app.icns";
                      fileicon set "$pd_windir/Zotero [1].app" "#{prefix}/icon/app-pdwin/Zotero [1].app.icns";
                      fileicon set "$pd_windir/Zotero [2].app" "#{prefix}/icon/app-pdwin/Zotero [2].app.icns";
                      fileicon set "$pd_windir/Zotero.app" "#{prefix}/icon/app-pdwin/Zotero.app.icns";
                      fileicon set "$pd_windir/任务管理器.app" "#{prefix}/icon/app-pdwin/任务管理器.app.icns";
                      fileicon set "$pd_windir/便笺.app" "#{prefix}/icon/app-pdwin/便笺.app.icns";
                      fileicon set "$pd_windir/入门.app" "#{prefix}/icon/app-pdwin/入门.app.icns";
                      fileicon set "$pd_windir/全球学术快报 [1].app" "#{prefix}/icon/app-pdwin/全球学术快报 [1].app.icns";
                      fileicon set "$pd_windir/全球学术快报.app" "#{prefix}/icon/app-pdwin/全球学术快报.app.icns";
                      fileicon set "$pd_windir/写字板.app" "#{prefix}/icon/app-pdwin/写字板.app.icns";
                      fileicon set "$pd_windir/反馈中心.app" "#{prefix}/icon/app-pdwin/反馈中心.app.icns";
                      fileicon set "$pd_windir/地图.app" "#{prefix}/icon/app-pdwin/地图.app.icns";
                      fileicon set "$pd_windir/天气.app" "#{prefix}/icon/app-pdwin/天气.app.icns";
                      fileicon set "$pd_windir/媒体播放器.app" "#{prefix}/icon/app-pdwin/媒体播放器.app.icns";
                      fileicon set "$pd_windir/实时字幕.app" "#{prefix}/icon/app-pdwin/实时字幕.app.icns";
                      fileicon set "$pd_windir/屏幕键盘.app" "#{prefix}/icon/app-pdwin/屏幕键盘.app.icns";
                      fileicon set "$pd_windir/应用安装程序 [1].app" "#{prefix}/icon/app-pdwin/应用安装程序 [1].app.icns";
                      fileicon set "$pd_windir/应用安装程序.app" "#{prefix}/icon/app-pdwin/应用安装程序.app.icns";
                      fileicon set "$pd_windir/录音机.app" "#{prefix}/icon/app-pdwin/录音机.app.icns";
                      fileicon set "$pd_windir/微软必应词典.app" "#{prefix}/icon/app-pdwin/微软必应词典.app.icns";
                      fileicon set "$pd_windir/快速助手.app" "#{prefix}/icon/app-pdwin/快速助手.app.icns";
                      fileicon set "$pd_windir/手机连接.app" "#{prefix}/icon/app-pdwin/手机连接.app.icns";
                      fileicon set "$pd_windir/扫描.app" "#{prefix}/icon/app-pdwin/扫描.app.icns";
                      fileicon set "$pd_windir/提示.app" "#{prefix}/icon/app-pdwin/提示.app.icns";
                      fileicon set "$pd_windir/摸鱼.app" "#{prefix}/icon/app-pdwin/摸鱼.app.icns";
                      fileicon set "$pd_windir/放大镜.app" "#{prefix}/icon/app-pdwin/放大镜.app.icns";
                      fileicon set "$pd_windir/文件资源管理器.app" "#{prefix}/icon/app-pdwin/文件资源管理器.app.icns";
                      fileicon set "$pd_windir/日历.app" "#{prefix}/icon/app-pdwin/日历.app.icns";
                      fileicon set "$pd_windir/日记.app" "#{prefix}/icon/app-pdwin/日记.app.icns";
                      fileicon set "$pd_windir/照片(旧版).app" "#{prefix}/icon/app-pdwin/照片(旧版).app.icns";
                      fileicon set "$pd_windir/照片.app" "#{prefix}/icon/app-pdwin/照片.app.icns";
                      fileicon set "$pd_windir/电影和电视.app" "#{prefix}/icon/app-pdwin/电影和电视.app.icns";
                      fileicon set "$pd_windir/画图 3D.app" "#{prefix}/icon/app-pdwin/画图 3D.app.icns";
                      fileicon set "$pd_windir/画图.app" "#{prefix}/icon/app-pdwin/画图.app.icns";
                      fileicon set "$pd_windir/相机.app" "#{prefix}/icon/app-pdwin/相机.app.icns";
                      fileicon set "$pd_windir/终端预览.app" "#{prefix}/icon/app-pdwin/终端预览.app.icns";
                      fileicon set "$pd_windir/能源之星X.app" "#{prefix}/icon/app-pdwin/能源之星X.app.icns";
                      fileicon set "$pd_windir/获取帮助.app" "#{prefix}/icon/app-pdwin/获取帮助.app.icns";
                      fileicon set "$pd_windir/视频编辑器.app" "#{prefix}/icon/app-pdwin/视频编辑器.app.icns";
                      fileicon set "$pd_windir/计算器.app" "#{prefix}/icon/app-pdwin/计算器.app.icns";
                      fileicon set "$pd_windir/记事本.app" "#{prefix}/icon/app-pdwin/记事本.app.icns";
                      fileicon set "$pd_windir/讲述人 [1].app" "#{prefix}/icon/app-pdwin/讲述人 [1].app.icns";
                      fileicon set "$pd_windir/讲述人.app" "#{prefix}/icon/app-pdwin/讲述人.app.icns";
                      fileicon set "$pd_windir/设置.app" "#{prefix}/icon/app-pdwin/设置.app.icns";
                      fileicon set "$pd_windir/语音访问.app" "#{prefix}/icon/app-pdwin/语音访问.app.icns";
                      fileicon set "$pd_windir/远程桌面.app" "#{prefix}/icon/app-pdwin/远程桌面.app.icns";
                      fileicon set "$pd_windir/适用于 Android™ 的 Windows 子系统设置.app" "#{prefix}/icon/app-pdwin/适用于 Android™ 的 Windows 子系统设置.app.icns";
                      fileicon set "$pd_windir/注册表编辑器.app" "#{prefix}/icon/app-pdwin/注册表编辑器.app.icns";
                      fileicon set "$pd_windir/适用于 Linux 的 Windows 子系统.app" "#{prefix}/icon/app-pdwin/适用于 Linux 的 Windows 子系统.app.icns";
                      fileicon set "$pd_windir/邮件.app" "#{prefix}/icon/app-pdwin/邮件.app.icns") > /dev/null 2>&1
                  # ;;

                  # -u | -U)
                      brew livecheck --tap bingokingo/bingokingo --newer-only
      #             ;;
      #             *)
      #                 exit 1
      #             ;;
      #         esac
      #     done
      # fi
    EOS

    # proapp app links
    (prefix/"app/papp").mkpath
    cpsrd = "#{papp_dir}/Compressor.app/Contents/Helpers"
    ln_s "#{cpsrd}/Droplet.app", "#{prefix}/app/papp/Droplet.app"
    lgpxd = "#{papp_dir}/Logic Pro X.app/Contents/Helpers"
    ln_s "#{lgpxd}/Impulse Response Utility.app", "#{prefix}/app/papp/Impulse Response Utility.app"

    # installed app links
    # (prefix/"app/inst").mkpath

    # icon library setup
    (prefix/"icon").mkpath
    cp_r Dir["Icons/*"], "#{prefix}/icon"
  end

  def caveats
    <<~EOS
      Due to security reasons, run the `bingokingo` command to add apps to the `/Applications` folder and check update.
      Open folder to see newer version code of apps to update:
        open ~'/Library/Android/sdk/build-tools/'
        open ~'/Library/Android/sdk/ndk/'
        open ~'/Library/Application Support/Unity/Application/'
        open '#{HOMEBREW_PREFIX}/opt/macvim/'
        open '#{HOMEBREW_PREFIX}/opt/python/'
    EOS
  end

  test do
    system "false"
  end
end
