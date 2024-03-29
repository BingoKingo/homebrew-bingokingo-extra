#!/bin/bash

update_deeplx(){
    last_version=$(curl -Ls "https://api.github.com/repos/OwO-Network/DeepLX/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/' | sed 's/v//g')
    sed -i "s/version \".*/version \"${last_version}\"/g" Formula/deeplx.rb
    wget -O deeplx_darwin_amd64 https://github.com/OwO-Network/DeepLX/releases/download/v${last_version}/deeplx_darwin_amd64
    wget -O deeplx_darwin_arm64 https://github.com/OwO-Network/DeepLX/releases/download/v${last_version}/deeplx_darwin_arm64
    amd64_sha256=$(sha256sum deeplx_darwin_amd64 | cut -d ' ' -f 1)
    arm64_sha256=$(sha256sum deeplx_darwin_arm64 | cut -d ' ' -f 1)
    sed -i "8s/.*/    sha256 \"${arm64_sha256}\"/" Formula/deeplx.rb
    sed -i "11s/.*/    sha256 \"${amd64_sha256}\"/" Formula/deeplx.rb
    rm -f deeplx_darwin*
}
update_deeplx