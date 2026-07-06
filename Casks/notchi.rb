cask "notchi" do
  version "0.1.10"
  sha256 "32f90155d709437456f7fa9d475cb00db17acbb6e94599c071affe590d9327ae"

  # v0.1.10 predates the Notch → Notchi rename, so the release asset and the
  # bundle inside it are still named Notch. Both flip to Notchi from the next
  # release — update the url pattern and the app stanza when bumping.
  url "https://github.com/cyrus-cai/notchi/releases/download/v#{version}/Notch-v#{version}.zip"
  name "Notchi"
  desc "Liquid-glass notch companion with built-in AI ask, notes, and reminders"
  homepage "https://github.com/cyrus-cai/notchi"

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
    "~/Library/Application Support/Notch",
    "~/Library/Application Support/Notchi",
    "~/Library/Application Support/NotchGlass",
    "~/Library/Caches/com.notchglass.app",
    "~/Library/Preferences/com.notchglass.app.plist",
  ]
end
