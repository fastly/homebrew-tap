# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.13.1"

  on_macos do
    on_intel do
      url "https://github.com/fastly/cli/releases/download/v10.13.1/fastly_v10.13.1_darwin-amd64.tar.gz"
      sha256 "1fe0158c128a2075ad167e879301cebaceb611edc53412cd94946d19e6bf3b09"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    on_arm do
      url "https://github.com/fastly/cli/releases/download/v10.13.1/fastly_v10.13.1_darwin-arm64.tar.gz"
      sha256 "8996890290434f6cc9dec020f9123f3e935d4e234a9bdd1ced77206fe720ac40"

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
        url "https://github.com/fastly/cli/releases/download/v10.13.1/fastly_v10.13.1_linux-amd64.tar.gz"
        sha256 "267a04c0133968debe3cb9e449ba7a0a0503c22c0051a70b17530ddc73c177f2"

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
        url "https://github.com/fastly/cli/releases/download/v10.13.1/fastly_v10.13.1_linux-arm64.tar.gz"
        sha256 "9abbb942cd2eaaba97ffc7d817f6a5a964d3d69d8e4ab2fa43d1f56752584e55"

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
