cask "claudenotch" do
  version "0.10.3"
  sha256 "7c3e23b5d5894d45c2e31f4a835cd955ad37b1316338326e4629d32135822a0e"

  url "https://github.com/rawsun007/claude-notch/releases/download/v#{version}/ClaudeNotch.dmg",
      verified: "github.com/rawsun007/claude-notch/"
  name "ClaudeNotch"
  desc "Shows Claude Code permission prompts in the notch"
  homepage "https://github.com/rawsun007/claude-notch"

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
