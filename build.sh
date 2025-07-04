apt install -y libabsl-dev libnghttp2-dev libevent-dev libexpat1-dev build-essential cmake libboost-all-dev miniupnpc libunbound-dev graphviz doxygen libunwind8-dev pkg-config libssl-dev libzmq3-dev libsodium-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler git 
apt install -y build-essential curl git pkg-config libssl-dev libgtk-3-dev libayatana-appindicator3-dev librsvg2-dev libwebkit2gtk-4.0-dev libjavascriptcoregtk-4.0-dev gir1.2-webkit2-4.0 gir1.2-javascriptcoregtk-4.0 libsoup-3.0-dev fakeroot dpkg-dev libjavascriptcoregtk-4.1-dev libwebkit2gtk-4.1-dev

echo "OPENSSL_PATH=$(which openssl)"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts
npm install -g yarn


curl https://sh.rustup.rs -sSf | sh -s -- -y
. "$HOME/.cargo/env"
rustc --version

git clone https://github.com/UnstoppableSwap/core
cd core
git submodule update --init --recursive
( cd src-gui/ && yarn install --network-timeout 600000 )



# cargo install tauri-cli --version 2.1.0
cargo install tauri-cli@2.1.0 --locked
cargo install typeshare-cli dprint
cd src-tauri/

# cargo tauri build --bundles deb,appimage --manifest-path src-tauri/Cargo.toml
# cargo build --manifest-path src-tauri/Cargo.toml
cargo tauri build --bundles deb,appimage