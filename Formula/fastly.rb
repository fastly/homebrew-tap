# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.16.0"

  on_macos do
    on_intel do
      url "https://github.com/fastly/cli/releases/download/v10.16.0/fastly_v10.16.0_darwin-amd64.tar.gz"
      sha256 "0bc0264273fbe083436ff9b210e100db2564e406827c95159ee5bbd96f4432c1"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    on_arm do
      url "https://github.com/fastly/cli/releases/download/v10.16.0/fastly_v10.16.0_darwin-arm64.tar.gz"
      sha256 "20cfb7c3a9aa9632c3a9f5d11034348d0db0672cbb99ae88f07c82884c3d322a"

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
        url "https://github.com/fastly/cli/releases/download/v10.16.0/fastly_v10.16.0_linux-amd64.tar.gz"
        sha256 "ed92b7f4cf9fb32ce35ad14cfd532b7d9f54b34b61ad3d11c9febc40780f932b"

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
        url "https://github.com/fastly/cli/releases/download/v10.16.0/fastly_v10.16.0_linux-arm64.tar.gz"
        sha256 "7a3d891fc0982944d2216594bc7b2db0bcde3d00aafcbad90d155a1c6c0a803b"

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
