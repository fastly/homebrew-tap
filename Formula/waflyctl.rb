class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/v0.1.6/waflyctl_0.1.6_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.1.6"
  sha256 "777b653d7d7bc5b1e29f9e0062862d8f6c4e66c13be025e0d9416c91513d67e9"

  def install
    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
