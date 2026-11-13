# Homebrew formula template for the tap coldic3/homebrew-tap (Formula/slipway.rb).
# The release workflow fills in VERSION and SHA256 and pushes it to the tap; see docs/releasing.md.
class Slipway < Formula
  desc "Local review station for AI-agent pull requests, promoted to GitHub after approval"
  homepage "https://github.com/coldic3/slipway"
  url "https://github.com/coldic3/slipway/releases/download/v1.2.0/coldic3-slipway-1.2.0.tgz"
  sha256 "f60960ed92945488991474ac3fbb6c4c79241206e5eb8e3af7c7a02bc4d9968a"
  license "MIT"

  depends_on "gitleaks"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  def caveats
    <<~EOS
      Set Slipway up (server, your login, the Claude Code plugin):
        slipway init
      Promotion to GitHub uses the GitHub CLI: brew install gh && gh auth login
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/slipway --version")
  end
end
