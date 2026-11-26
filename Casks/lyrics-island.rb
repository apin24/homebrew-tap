cask "lyrics-island" do
  version "0.1.2"
  sha256 "a8a05f23258d897ce0ee6d9cc2cb88569cc2080fd947d0a40bdd272cd4771650"

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
