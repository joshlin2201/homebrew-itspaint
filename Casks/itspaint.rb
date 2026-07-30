cask "itspaint" do
  version "0.11.0"
  sha256 "a0837644cdd310c18e1c94514aa4e6a9cc880d24f550ca86ee8037cc8548df81"

  url "https://github.com/joshlin2201/itspaint/releases/download/v#{version}/ItsPaint-#{version}.dmg"
  name "ItsPaint"
  desc "Paint editor for screenshots, sketches and pixel-precise edits"
  homepage "https://github.com/joshlin2201/itspaint"

  # Tags, not releases. Every 0.x build is published as a GitHub pre-release,
  # and both release strategies discard those outright — github_releases.rb does
  # `next if release["draft"] || release["prerelease"]`, so it matches nothing
  # and livecheck reports "Unable to get versions". Tags carry no such flag, and
  # a draft release pushes no tag, so drafts are excluded for free.
  livecheck do
    url "https://github.com/joshlin2201/itspaint.git"
    strategy :git
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on macos: :sonoma

  app "ItsPaint.app"

  uninstall quit: "com.joshlin.itspaint"

  # Generated with `brew generate-zap` after launching the app, not reasoned
  # about. The app is sandboxed, so its preferences, caches and saved state live
  # inside the container rather than at ~/Library/Preferences — listing those
  # conventional paths would be cargo cult. What genuinely sits outside the
  # sandbox is the Application Scripts directory, the LaunchServices recent-
  # documents list, and crash reports.
  zap trash: [
    "~/Library/Application Scripts/com.joshlin.itspaint",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/com.joshlin.itspaint.sfl*",
    "~/Library/Application Support/CrashReporter/ItsPaint_*.plist",
    "~/Library/Containers/com.joshlin.itspaint",
  ]
end
