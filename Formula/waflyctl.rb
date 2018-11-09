class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/v0.2.0/waflyctl_0.2.0_darwin_amd64.tar.gz"
  version "0.2.0"
  sha256 "9f824dfe5f895ac5b557a2366179a3233492ffc81d3d77a44d9ef3eab238793d"

  def install
    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
