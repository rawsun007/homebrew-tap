cask "claudenotch" do
  version "0.7.3"
  sha256 "aacab0f9a3157e80879588c5842d2d939497a15feee23751b95e2fd2eff6f252"

  url "https://github.com/rawsun007/claude-notch/releases/download/v#{version}/ClaudeNotch.dmg",
      verified: "github.com/rawsun007/claude-notch/"
  name "ClaudeNotch"
  desc "Shows Claude Code permission prompts in your Mac's notch"
  homepage "https://github.com/rawsun007/claude-notch"

  app "ClaudeNotch.app"

  caveats <<~EOS
    ClaudeNotch is ad-hoc signed (not yet notarized). On first launch:
      right-click ClaudeNotch in /Applications and choose Open.

    Then open the Setup window from the menu-bar bell to wire up the
    Claude Code hooks.
  EOS
end
