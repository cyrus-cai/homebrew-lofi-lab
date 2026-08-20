cask "notchi" do
  version "0.6.2"
  sha256 "48382dccb6f143a353860e69de9bb73b37625dcfd9f06bd9890eb153bc2d64c2"

  url "https://github.com/cyrus-cai/notchi/releases/download/v#{version}/Notchi-v#{version}.zip"
  name "Notchi"
  desc "Liquid-glass notch companion with built-in AI ask, notes, and reminders"
  homepage "https://github.com/cyrus-cai/notchi"

  # Notchi updates itself: the in-app updater fetches the newest GitHub release
  # and replaces its own bundle in place — the very Notchi.app this cask put in
  # /Applications. Homebrew reads the installed version from its own receipt,
  # never from the bundle, so declaring `false` here was a lie with teeth: a
  # user who installed 0.6.1 from the tap and then updated in-app to 0.6.3 still
  # has `0.6.1` on the receipt, and the next `brew upgrade` would write this
  # cask's older version straight over the newer app on disk. Declaring the
  # truth keeps brew out of that loop; `--greedy` still forces an upgrade, which
  # is the user asking for it in so many words.
  auto_updates true
  depends_on macos: :sonoma

  app "Notchi.app"

  # The app ships ad-hoc signed and is not notarized, so Gatekeeper would
  # otherwise block first launch. Strip the quarantine attribute on install —
  # the same thing the project's install.sh does for curl installs.
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
