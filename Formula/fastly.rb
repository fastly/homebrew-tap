# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.18.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v10.18.0/fastly_v10.18.0_darwin-amd64.tar.gz"
      sha256 "52fed8a0cfd4d2958579ed70a2ec8e84eda794b0627d832c612a2fcb9e25cf62"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v10.18.0/fastly_v10.18.0_darwin-arm64.tar.gz"
      sha256 "8ec534806354f56e85e5c057ceeb1b24ac859b184e8b0bc6e05e38b11e6b294a"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/fastly/cli/releases/download/v10.18.0/fastly_v10.18.0_linux-amd64.tar.gz"
        sha256 "d8bbb224f819834148b5e27ea263ff7cd5f432fc617856f3cbd6b1d8c59aa593"

        def install
          system "make" if build.head?
          bin.install "fastly"
          (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
          (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/fastly/cli/releases/download/v10.18.0/fastly_v10.18.0_linux-arm64.tar.gz"
        sha256 "699d73b318fc8af9c27be52e5033fde4ce60b50564182a76c9a9ce7c4da165a4"

        def install
          system "make" if build.head?
          bin.install "fastly"
          (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
          (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
        end
      end
    end
  end

  head do
    url "https://github.com/fastly/cli.git"
    depends_on "go"
  end

  test do
    help_text = shell_output("#{bin}/fastly --help")
    assert_includes help_text, "Usage:"
  end
end
