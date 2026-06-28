class Gitswitch < Formula
  desc "Terminal UI for managing multiple local git identities"
  homepage "https://github.com/aksisonline/gitswitch"
  version "0.1.25"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-arm64"
      sha256 "80832752f962432de3797c1b1bc76d9162e9f35ce86483d0b897f27f6f252416"
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-darwin-amd64"
      sha256 "bf1b5e7fb8702c0d03d6c92c80b21ce854d35d994798314f12ebb8b24c3c0a8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-arm64"
      sha256 "291979b68c83066ab842313c382cd3ca2521e17447ae90b7d71037ad22d42f0a"
    else
      url "https://github.com/aksisonline/gitswitch/releases/download/v#{version}/gitswitch-linux-amd64"
      sha256 "36ab262009fc805f9337a05626b3faf4aa5880687832d8b1f746cfccf69ff314"
    end
  end

  def install
    binary_name = if OS.mac?
                    "gitswitch-darwin-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}"
                  else
                    "gitswitch-linux-#{Hardware::CPU.arm? ? 'arm64' : 'amd64'}"
                  end
    bin.install binary_name => "gitswitch"
  end

  test do
    system "#{bin}/gitswitch", "--help"
  end
end
