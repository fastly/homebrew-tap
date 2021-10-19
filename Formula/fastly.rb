# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.41.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.41.0/fastly_v0.41.0_darwin-amd64.tar.gz"
      sha256 "4d4a9840a3dbb9ff11a6281176c943f59d631a8ba3e1e3565f27423442fabcf0"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v0.41.0/fastly_v0.41.0_darwin-arm64.tar.gz"
      sha256 "c91a3ae8cf55cf95805149bc212cafaac3bf8d3d06eaeda933cf4c3c3ad07b0d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.41.0/fastly_v0.41.0_linux-amd64.tar.gz"
      sha256 "ae882b4598869d3f4c496374e5e553bdc0f59c53e1bf254e86f1a2190008619a"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v0.41.0/fastly_v0.41.0_linux-arm64.tar.gz"
      sha256 "f2bc71784b2d9c0b7029dbcb46e1da2e7103a1573e5420af0a1f8875737f7c5b"
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
