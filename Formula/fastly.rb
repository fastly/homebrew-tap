# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v10.8.1/fastly_v10.8.1_darwin-arm64.tar.gz"
      sha256 "f7d6177646e3b6c7afd10f340f929c06227a42e9a06ffbdaa1b60ab0801c2b95"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v10.8.1/fastly_v10.8.1_darwin-amd64.tar.gz"
      sha256 "5d0f272f1f85bd013edb9ef04c4cb7dcff870cdd7ee06c4f8015d59113bd3e53"

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
      url "https://github.com/fastly/cli/releases/download/v10.8.1/fastly_v10.8.1_linux-amd64.tar.gz"
      sha256 "20dfba7901051ef44824c31358ab70e56e20d1890477087ba19ad8cd2878a4a0"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v10.8.1/fastly_v10.8.1_linux-arm64.tar.gz"
      sha256 "49997257f44b8140969d7f206e8e8a474e7c65df314fa0787d555effb1949e55"

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
