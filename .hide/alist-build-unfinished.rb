class Alist < Formula
  desc "File list program that supports multiple storage powered by Gin and Solidjs"
  homepage "https://alist.nn.ci/"
  url "https://github.com/alist-org/alist/archive/v#{version}.tar.gz"
  version "3.26.0"
  license "AGPL-3.0-only"
  head "https://github.com/alist-org/alist.git", branch: "main"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on "glib" => :build
  depends_on "go>=1.20" => :build
  # depends_on "node" => :build
  # depends_on "pnpm" => :build

  # if OS.mac?
  #   if Hardware::CPU.arm?
  #     url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-arm64.tar.gz"
  #     sha256 "8fc01c603e1f48a72e0d47eb9f283ceaecd97672890b776a3c183d9e8e9ec1ac"
  #   elsif Hardware::CPU.intel?
  #     url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-darwin-amd64.tar.gz"
  #     sha256 "d4d64db13fc1f52404c8c4e347bb67d9ec1cc45b96cd6b2829a30b8227cce6aa"
  #   end
  # elsif OS.linux? && Hardware::CPU.intel?
  #   url "https://github.com/alist-org/alist/releases/download/v#{version}/alist-linux-amd64.tar.gz"
  #   sha256 "555a8482aeedb15a0e28a7a6e19868d417816d3f23b37b68cab597b7bfc10c9a"
  # end

  def install
    # bin.install "alist"
    system "git", "clone", "--recurse-submodules", "https://github.com/alist-org/alist-web.git"
    cd alist-web
wget https://crowdin.com/backend/download/project/alist/zh-CN.zip
unzip zh-CN.zip
node ./scripts/i18n.mjs
rm zh-CN.zip
pnpm install
pnpm run build

cp -r /alist-web/dist /alist/public/

appName="alist"
builtAt="$(date +'%F %T %z')"
goVersion=$(go version | sed 's/go version //')
gitAuthor=$(git show -s --format='format:%aN <%ae>' HEAD)
gitCommit=$(git log --pretty=format:"%h" -1)
version=$(git describe --long --tags --dirty --always)
webVersion=$(wget -qO- -t1 -T2 "https://api.github.com/repos/alist-org/alist-web/releases/latest" | grep "tag_name" | head -n 1 | awk -F ":" '{print $2}' | sed 's/\"//g;s/,//g;s/ //g')
go build -ldflags="$ldflags" .

    ldflags = %W[
      -s -w
      -X github.com/alist-org/alist/v3/internal/conf.BuiltAt=#{vars.match(/builtAt="(.*)"/)[1]}
      -X github.com/alist-org/alist/v3/internal/conf.GoVersion=#{vars.match(/goVersion="(.*)"/)[1]}
      -X github.com/alist-org/alist/v3/internal/conf.GitAuthor=#{gitAuthor}
      -X github.com/alist-org/alist/v3/internal/conf.GitCommit=#{gitCommit}
      -X github.com/alist-org/alist/v3/internal/conf.Version=#{vars.match(/version="(.*)"/)[1]}
      -X github.com/alist-org/alist/v3/internal/conf.WebVersion=#{vars.match(/webVersion="(.*)"/)[1]}
    ]
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/tailscale"
    system "go", "build", *std_go_args(ldflags: ldflags, output: bin/"tailscaled"), "./cmd/tailscaled"

  end

  def post_install
    (var/"log/alist").mkpath
    (etc/"alist").mkpath
    prefix.install_symlink etc/"alist" => opt_prefix/"data"
    ln_s var/"log/alist", opt_prefix/"data/log"
  end

  service do
    run [opt_bin/"alist", "server"]
    working_dir opt_prefix
    keep_alive true
  end

  def caveats
    <<~EOS
      To reveal alist admin user's info in default `config.json` again, run the following command:
        cd #{opt_prefix} && alist admin
      Or reveal password via `sqlite3` command:
        sqlite3 #{etc}/alist/data.db "select password from x_users where username = 'admin'"
    EOS
  end

  test do
    system bin/"alist", "version"
    system bin/"alist", "admin"
  end
end
