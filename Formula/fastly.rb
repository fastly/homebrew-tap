# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.14.1"

  on_macos do
    on_intel do
      url "https://github.com/fastly/cli/releases/download/v10.14.1/fastly_v10.14.1_darwin-amd64.tar.gz"
      sha256 "78fa332a1b5dfe1bcc567d2d5a0f8bfd56e82b90c1a5a7e8d784d042b8d1518b"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    on_arm do
      url "https://github.com/fastly/cli/releases/download/v10.14.1/fastly_v10.14.1_darwin-arm64.tar.gz"
      sha256 "f4e894279e9ca97695047d739bd40e1d8bb94d33f1d04b8597b993b39f53bbad"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/fastly/cli/releases/download/v10.14.1/fastly_v10.14.1_linux-amd64.tar.gz"
        sha256 "460a371a52e02be4da5fae88dcad2e3c4ee9d481b16904c3853dc30c4b0af039"

        def install
          system "make" if build.head?
          bin.install "fastly"
          (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
          (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/fastly/cli/releases/download/v10.14.1/fastly_v10.14.1_linux-arm64.tar.gz"
        sha256 "a43f144467e845924cce66c4ca1326b58a98916497cf2a6c00bb58b1f76e06a3"

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
