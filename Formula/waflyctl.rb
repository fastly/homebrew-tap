class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/v0.1.8/waflyctl_0.1.8_darwin_amd64.tar.gz"
  version "0.1.8"
  sha256 "2d4a3f7aaf6dddf649ba14ac9d4b54ce2817fb15752bfd43ac394e929bf5ad51"

  def install
    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
