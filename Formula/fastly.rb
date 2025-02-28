# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.19.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v10.19.0/fastly_v10.19.0_darwin-amd64.tar.gz"
      sha256 "5ec9dc6d0031d102fdf98919b418f248f23d2f6f106651cd31a62b14eed62f8c"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v10.19.0/fastly_v10.19.0_darwin-arm64.tar.gz"
      sha256 "dbe68f66ca469fa7e2288374f6846388a90fc80204162279e4215af2a5e3e605"

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
        url "https://github.com/fastly/cli/releases/download/v10.19.0/fastly_v10.19.0_linux-amd64.tar.gz"
        sha256 "2df4e2593d6f8bdf9e3eb906c4c1ee5f548992da06df852726090b1b0d08b070"

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
        url "https://github.com/fastly/cli/releases/download/v10.19.0/fastly_v10.19.0_linux-arm64.tar.gz"
        sha256 "7fdf055a97b1f8211bbe1d747a5cc015a6caf413fe8abaff173c0f066317ad8a"

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
