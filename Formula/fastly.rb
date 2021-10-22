# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Fastly < Formula
  desc "Fastly CLI"
  homepage "https://github.com/fastly/cli"
  version "0.42.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.42.0/fastly_v0.42.0_darwin-amd64.tar.gz"
      sha256 "01d23189442fa66c41572c6f18709bc80fa1977d3dc9033ee090d68157da0416"
    end
    if Hardware::CPU.arm?
      url "https://github.com/fastly/cli/releases/download/v0.42.0/fastly_v0.42.0_darwin-arm64.tar.gz"
      sha256 "676f76f71d188391a3687979e75b8ea75fbd5ba0f3a81694bbdd981402312b2e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/fastly/cli/releases/download/v0.42.0/fastly_v0.42.0_linux-amd64.tar.gz"
      sha256 "b2e515299a1575225da2efc637c55bc56e81145ad2504dac5d4238b5b0d18c46"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/fastly/cli/releases/download/v0.42.0/fastly_v0.42.0_linux-arm64.tar.gz"
      sha256 "d0daff27f0e8f943b38b31a973fe425ff728e239236be9491d4058ebec5fb4f9"
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
