cask "notch" do
  version "0.1.8"
  sha256 "917b67f599707ad07bf749940894bcc475814ae6296b7c2203e27b5ebb39d88f"

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