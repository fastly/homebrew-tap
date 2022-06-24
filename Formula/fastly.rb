# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "3.0.1"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v3.0.1/fastly_v3.0.1_darwin-amd64.tar.gz"
      sha256 "de4f533d3087e34b4c85324040561849ff1a87a139beb21aa8691288003111da"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v3.0.1/fastly_v3.0.1_darwin-arm64.tar.gz"
      sha256 "fee8b7d8cea2ae7921392d9e1e19b7ee6663974d4e51a53a52f5a94d2c85e0cb"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v3.0.1/fastly_v3.0.1_linux-arm64.tar.gz"
      sha256 "70801435fbb2907863a4f0b76056f40e2fe13942b6d401ff18c798abdb8fc39e"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v3.0.1/fastly_v3.0.1_linux-amd64.tar.gz"
      sha256 "843ceb9cd2a5fdb41ba39fdadab26596b5fe441f20aebf01163e1ed0a5d0c691"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
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
