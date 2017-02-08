#!/bin/bash

if [[ $OSTYPE != *darwin* ]]; then
    exit
fi

printf "System - Avoid creating .DS_Store files on network volumes\n"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

printf "Keyboard - Enable keyboard access for all controls\n"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

printf "Keyboard - Set a fast keyboard repeat rate\n"
defaults write NSGlobalDomain KeyRepeat -int 2

printf "Keyboard - Set a fast initial key repeat rate\n"
defaults write NSGlobalDomain InitialKeyRepeat -int 15

printf "iCloud - Save to disk by default\n"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

printf "Finder - Show filename extensions\n"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf "Finder - Disable the warning when changing a file extension\n"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

printf "Finder - Use list view in all Finder windows\n"
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

printf "TextEdit - Use plain text mode for new documents\n"
defaults write com.apple.TextEdit RichText -int 0

printf "TextEdit - Open and save files as UTF-8 encoding\n"
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

printf "Printer - Expand print panel by default\n"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

printf "Printer - Automatically quit printer app once the print jobs complete\n"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

printf "TeXShop - Add RMarkdown extensions"
defaults write TeXShop OtherTeXExtensions -array-add "Rmd"
defaults write TeXShop OtherTeXExtensions -array-add "rmd"

xscreensaver_hacks=( AntSpotlight Apple2 BSOD BlitSpin BoxFit Bumps Carousel Distort FlipFlop FlipScreen3D GFlux GLSlideshow Gleidescope Jigsaw Penetrate Photopile Ripples RotZoomer SlideScreen Slip Spotlight Tessellimage Twang XAnalogTV Zoom )

printf "xscreensaver - Never use Photo Library or Desktop Images\n"
for i in "${xscreensaver_hacks[@]}"
do
    printf " => ${i}...\n"
    defaults write org.jwz.xscreensaver.${i} grabDesktopImages -int 0
    defaults write org.jwz.xscreensaver.${i} chooseRandomImages -int 1
    defaults write org.jwz.xscreensaver.${i} imageDirectory -string "/Library/Screen Savers/Default Collections"
done
