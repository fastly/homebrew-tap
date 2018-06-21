class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/0.1.4/waflyctl_0.1.4_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.1.4"
  sha256 "1b2c94ac5f31de275170265040ca2c922d31eeb6f05d4d5ad0003c622965ef93"

  def install
    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
