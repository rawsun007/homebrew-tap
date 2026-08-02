cask "claudenotch" do
  version "0.13.0"
  sha256 "d4b8805dac6859c9edd99edb663cff081f17bcfe3a296ffb6ad04d433f42da50"

  url "https://github.com/rawsun007/claude-notch/releases/download/v#{version}/ClaudeNotch.dmg",
      verified: "github.com/rawsun007/claude-notch/"
  name "ClaudeNotch"
  desc "Shows Claude Code permission prompts in the notch"
  homepage "https://github.com/rawsun007/claude-notch"

  # v0.13.0 and earlier ship an arm64-only binary. Without this, Homebrew
  # installs happily on an Intel Mac and the app then refuses to launch, which
  # reads as a broken app rather than the wrong architecture. Drop this line
  # once a universal build is released.
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ClaudeNotch.app"

  # ClaudeNotch is a menu-bar app that stays running. On `brew upgrade`, the old
  # copy must be quit before the new one can replace it, or the install fails
  # with the app "in use" and the update silently does not take effect. `quit`
  # terminates the running instance first so the swap is clean.
  uninstall quit: "com.claudenotch.app"

  # `brew uninstall --zap` also removes the app's own data: persisted state and
  # hook scripts under ~/.claudenotch, debug/crash logs under Application
  # Support, and the preferences plist. (Run ~/.claudenotch/bin/uninstall-hooks.sh
  # first if you also want settings.json restored.)
  zap trash: [
    "~/.claudenotch",
    "~/Library/Application Support/ClaudeNotch",
    "~/Library/Preferences/com.claudenotch.app.plist",
  ]

  caveats <<~EOS
    ClaudeNotch is ad-hoc signed (not yet notarized). On first launch:
      right-click ClaudeNotch in /Applications and choose Open.

    Then open the Setup window from the menu-bar bell to wire up the
    Claude Code hooks.
  EOS
end
