cask "notchi" do
  version "0.1.11"
  sha256 "e078aa3f8ef7af87c9a19470fc3b33a5cbeb1dc08340caa9ac00e712dc91fc9e"

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
