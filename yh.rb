class Yh < Formula
    desc "YAML syntax highlighter to bring colours where only jq could"
    homepage "https://github.com/andreazorzetto/yh"
    url "https://github.com/andreazorzetto/yh/archive/v0.2.1.tar.gz"
    sha256 "799af7ae49764d5a9a09ea509154c876a6e817f14b0b2efd7c06c4735f2f4891"
    license "Apache-2.0"
  
    head "https://github.com/andreazorzetto/yh.git"
  
    livecheck do
      url "https://github.com/andreazorzetto/yh/releases/latest"
      regex(%r{href=.*?/tag/(v(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*))?}i)
    end
  
    depends_on "go" => :build
  
    def install
      ENV["GOPATH"] = buildpath
  
      # Install Go dependencies - should use Go vendoring
      system "go", "get", "github.com/logrusorgru/aurora"
  
      # Build and install termshare
      system "go", "build", "-o", "yh"
      bin.install "yh"
    end
  
    test do
      system "#{bin}/yh", "version"
    end
  end
  