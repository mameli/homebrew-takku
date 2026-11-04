cask "takku" do
  version "1.18.0"
  sha256 "ce62b46b8e2622963fe020198ef337bb6e8e368c95ec627cdaa0bacea6de6527"

  url "https://github.com/mameli/Takku/releases/download/v#{version}/Takku-#{version}.dmg"
  name "Takku"
  desc "Records meetings, transcribes them locally and writes Markdown notes"
  homepage "https://takku.app"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Takku.app"
  # `takku list|search|get|mcp`: the meetings in the terminal (Takku 1.16.0 or later).
  binary "#{appdir}/Takku.app/Contents/MacOS/Takku", target: "takku"

  uninstall quit: "app.takku.takku"

  # Takku was called Steno until 0.2.1: its leftovers go too.
  zap trash: [
    "~/Library/Application Support/Steno",
    "~/Library/Application Support/Takku",
    "~/Library/Caches/app.takku.takku",
    "~/Library/Caches/dev.mameli.steno",
    "~/Library/HTTPStorages/app.takku.takku",
    "~/Library/HTTPStorages/dev.mameli.steno",
    "~/Library/Preferences/app.takku.takku.plist",
    "~/Library/Preferences/dev.mameli.steno.plist",
  ]
end
