cask "notchi" do
  version "0.6.0"
  sha256 "3b155868a0a746fb2c9d457b28496c4cb2cabaa7ce42e704b24f97adfe989678"

  url "https://github.com/cyrus-cai/notchi/releases/download/v#{version}/Notchi-v#{version}.zip"
  name "Notchi"
  desc "Liquid-glass notch companion with built-in AI ask, notes, and reminders"
  homepage "https://github.com/cyrus-cai/notchi"

  # The app ships ad-hoc signed and is not notarized, so Gatekeeper would
  # otherwise block first launch. Strip the quarantine attribute on install —
  # the same thing the project's install.sh does for curl installs.
  auto_updates false
  depends_on macos: :sonoma

  app "Notchi.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Notchi.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Notch",
    "~/Library/Application Support/Notchi",
    "~/Library/Application Support/NotchGlass",
    "~/Library/Caches/com.notchglass.app",
    "~/Library/Preferences/com.notchglass.app.plist",
  ]
end
