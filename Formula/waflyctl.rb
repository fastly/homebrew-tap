class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/0.1.5/waflyctl_0.1.5_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.1.5"
  sha256 "56376489d7a1a861c2c9558cfe24f1cd14db962eadfaaaf5d85672d16716ef91"

  def install
    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
