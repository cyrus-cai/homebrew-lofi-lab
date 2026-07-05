cask "notch" do
  version "0.1.9"
  sha256 "5db92a5087cf3a63a693b769e6edc2230fd314ba5f75e2a14ffa83a0dd7c59c7"

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