# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "A CLI for interacting with the Fastly platform"
  homepage "https://github.com/fastly/cli"
  version "10.10.0"

  on_macos do
    on_intel do
      url "https://github.com/fastly/cli/releases/download/v10.10.0/fastly_v10.10.0_darwin-amd64.tar.gz"
      sha256 "5f9840d6bdba768c7e87658e3f9e3083b35a43952363caedc676809efcc920e4"

      def install
        system "make" if build.head?
        bin.install "fastly"
        (bash_completion/"fastly.sh").write `#{bin}/fastly --completion-script-bash`
        (zsh_completion/"_fastly").write `#{bin}/fastly --completion-script-zsh`
      end
    end
    on_arm do
      url "https://github.com/fastly/cli/releases/download/v10.10.0/fastly_v10.10.0_darwin-arm64.tar.gz"
      sha256 "14c5cb8dfbc7211bb8fc430be2ff4d99211c69394a412fb29faa7d1fdebe0e3c"

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
        url "https://github.com/fastly/cli/releases/download/v10.10.0/fastly_v10.10.0_linux-amd64.tar.gz"
        sha256 "57e5560e3f684d8d9cb05fcaa8c968c35b5254c2684c4a54ce1d9d5fb3db8cb4"

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
        url "https://github.com/fastly/cli/releases/download/v10.10.0/fastly_v10.10.0_linux-arm64.tar.gz"
        sha256 "2f5b1e660805ab7f0386c604a2546298b24f7fc22f2a29b865ebe4685d207097"

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
