class Waflyctl < Formula
  desc "Allows you to provision a Fastly waf object with pre-determine rules, OWASP config, response, and logging endpoints. Also manage rules, and their status."
  homepage "https://github.com/fastly/waflyctl"
  url "https://github.com/fastly/waflyctl/releases/download/v0.1.8/waflyctl_0.1.8_darwin_amd64.tar.gz"
  version "0.1.8"
  sha256 "2d4a3f7aaf6dddf649ba14ac9d4b54ce2817fb15752bfd43ac394e929bf5ad51"

  head do
    url "https://github.com/fastly/waflyctl.git"
    depends_on "dep" => :build
    depends_on "go" => :build
  end

  def install
    if build.head?
      ENV["GOPATH"] = buildpath
      (buildpath/"src/github.com/fastly/waflyctl").install buildpath.children
      cd "src/github.com/fastly/waflyctl" do
        system "dep", "ensure", "-vendor-only"
        system "go", "build", "-o", buildpath/"waflyctl"
      end
    end

    bin.install "waflyctl"
  end

  test do
    system "#{bin}/waflyctl"
  end
end
