class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/v0.1.7/waflyctl_0.1.7_darwin_amd64.tar.gz"
  version "0.1.7"
  sha256 "43fc9a8e1fc0ee8671967ee38fd64c1cdb53352b926bc2ac4e244d8397998abb"

  def install
    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
