cask "exhausted-model" do
  version "2.2.0"
  sha256 "9d537bc03839013f9a3b6f98369023a3e5a2e0a75b3da3f0ef4682e5030c3b7a"

  url "https://github.com/Snupk/exhausted-model/releases/download/v#{version}/ExhaustedModel-v#{version}-arm64.zip"
  name "Exhausted Model"
  desc "Menu bar app for tracking Claude Code token usage and limits"
  homepage "https://github.com/Snupk/exhausted-model"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "ExhaustedModel.app"

  # The app is not notarized yet; drop the download quarantine so it opens normally.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/ExhaustedModel.app"]
  end

  zap trash: "~/.exhausted-model"
end
