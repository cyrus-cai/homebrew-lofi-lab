cask "notch" do
  version "0.1.7"
  sha256 "cad0dd795aa5328451173bb8c655f40593bb07ed072d4e10f7dd1da870edfd18"

  url "https://github.com/cyrus-cai/notch/releases/download/v#{version}/Notch-v#{version}.zip"
  name "Notch"
  desc "Liquid-glass notch companion with built-in AI ask, notes, and reminders"
  homepage "https://github.com/cyrus-cai/notch"

  # The app ships ad-hoc signed and is not notarized, so Gatekeeper would
  # otherwise block first launch. Strip the quarantine attribute on install —
  # the same thing the project's install.sh does for curl installs.
  auto_updates false
  depends_on macos: :sonoma

  app "Notch.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Notch.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/NotchGlass",
    "~/Library/Caches/com.notchglass.app",
    "~/Library/Preferences/com.notchglass.app.plist",
  ]
end
