#!/bin/sh -x

echo "Doing OSX install"

export HOMEBREW_NO_AUTO_UPDATE=1

brew tap Caskroom/cask
brew tap runtimeco/homebrew-mynewt

brew cask uninstall oclint
brew install Caskroom/cask/gcc-arm-embedded mynewt-newt gcc5
