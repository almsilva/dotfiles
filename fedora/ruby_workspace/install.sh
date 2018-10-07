#!/bin/sh

ruby_version=2.5.1

echo "---"
echo "Ruby and Rbenv installation:"
echo " "
echo "This script will install the Ruby runtime environment using Rbenv and Rbuild."
echo "It takes as assumption that git is already installed and configured."
echo "---"
echo "ATTENTION:"
echo " "
echo "Different versions may require additional dependencies. The dependencies installed"
echo "during this script are the ones required by MRI 2.5.1."
echo "---"
echo "SUMMARY:"
echo " "
echo "Ruby version to be installed: ${ruby_version}"
echo "Rbenv installation folder: ${HOME}/.rbenv"
echo "---"

echo "1. Installing Rbenv..."
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
source ~/.bash_profile

echo "2. Installing Rbuild..."
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

echo "3. Installing Ruby ${ruby_version}..."
sudo dnf install -y openssl-devel readline-devel zlib-devel
rbenv install $ruby_version
rbenv global $ruby_version
rbenv rehash

echo "4. Installing Bundler..."
gem install bundle --no-rdoc --no-ri

echo "5. Done! Check if the version is correc."
echo "---"
ruby --version
echo "---"
