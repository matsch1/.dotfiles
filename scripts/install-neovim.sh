# install prerequesities
# arch
sudo pacman -S base-devel cmake unzip ninja curl
# ubuntu
# sudo apt-get install ninja-build gettext cmake unzip curl build-essential

git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo

sudo make install
