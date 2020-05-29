# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.11.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/fastly/cli/releases/download/v0.11.0/fastly_v0.11.0_darwin-amd64.tar.gz"
    sha256 "03c2b5251b4dd3d65bdc504d9ce9eceee0bd718df1877f7ea25fcf4db1222051"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.11.0/fastly_v0.11.0_linux-amd64.tar.gz"
      sha256 "4acc0dc2a7215481c394315ea6b678ccc57d04dd832a5802d70cc45910162e9d"
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/fastly/cli/releases/download/v0.11.0/fastly_v0.11.0_linux-arm64.tar.gz"
        sha256 "95c811607426f529d1ad2cea73f58459f63339bf9552ab2b152b234741b867a1"
      else
      end
    end
  end
  
  head do
    url "https://github.com/fastly/cli.git"
    depends_on "go"
  end

  def install
    system "make" if build.head?
    bin.install "fastly"
    (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
    (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
  end

  test do
    help_text = shell_output("#{bin}/fastly --help")
    assert_includes help_text, "Usage:"
  end
end
