# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.39.3"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.39.3/fastly_v0.39.3_darwin-amd64.tar.gz"
      sha256 "c63f39825fc4c98842fdbba63b9be99f103209cb9e2ea4938c4732113a554350"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v0.39.3/fastly_v0.39.3_darwin-arm64.tar.gz"
      sha256 "b1e80318f87b3f53a8cba1be0f5e39010f70c76367678f3b93cf40bfb0b87504"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.39.3/fastly_v0.39.3_linux-amd64.tar.gz"
      sha256 "7ca8babce1c87fbf5fa01018a71a9a19a5c1464cf9203e059e3e0f7f5805b606"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v0.39.3/fastly_v0.39.3_linux-arm64.tar.gz"
      sha256 "b05c181804a7cfc8bacc61587d769034d59a52e01048505722c6b626dfbade92"
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
