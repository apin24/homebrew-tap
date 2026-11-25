cask "lyrics-island" do
  version "0.1.1"
  sha256 "ffed49e685ca8744d32eb5a2accffc9e4582e3d0d33fc83d10a60be559549b36"

  url "https://github.com/apin24/lyrics-island/releases/download/v#{version}/LyricsIsland-#{version}.zip"
  name "Lyrics Island"
  desc "Synced Spotify lyrics in a Dynamic Island-style pill"
  homepage "https://github.com/apin24/lyrics-island"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "LyricsIsland.app"

  uninstall quit: "dev.lyricsisland.app"

  zap trash: [
    "~/Library/Caches/LyricsIsland",
    "~/Library/Preferences/dev.lyricsisland.app.plist",
  ]

  caveats <<~EOS
    Lyrics Island is not notarized by Apple yet, so macOS blocks the first launch.
    Allow it once in System Settings → Privacy & Security → Open Anyway, or run:
      xattr -dr com.apple.quarantine #{appdir}/LyricsIsland.app

    It needs the Spotify desktop app (not the web player). Click OK when macOS asks
    whether Lyrics Island may control Spotify.
  EOS
end
