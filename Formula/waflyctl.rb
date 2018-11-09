class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/v0.2.1/waflyctl_0.2.1_darwin_amd64.tar.gz"
  version "0.2.1"
  sha256 "324e9cf3df33fcb962d1ec84a01445da2766cd4c33f78d212f5b4792b07db442"

  def install
    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
