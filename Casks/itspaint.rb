cask "itspaint" do
  version "0.12.0"
  sha256 "8e2e7246f7b8a0705a268ef0d3d66f655be1d73f6b2a378ce7035b4fe4771c54"

  url "https://github.com/joshlin2201/itspaint/releases/download/v#{version}/ItsPaint-#{version}.dmg"
  name "ItsPaint"
  desc "Paint editor for screenshots, sketches and pixel-precise edits"
  homepage "https://itspaintmac.com/"

  livecheck do
    url :url
    strategy :github_latest
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
