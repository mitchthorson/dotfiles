mkdir -p ~/.local/share/fonts

cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/UbuntuMono.zip
unzip UbuntuMono.zip -d UbuntuMono
cp UbuntuMono/*.ttf ~/.local/share/fonts
rm -rf UbuntuMono.zip UbuntuMono

wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/IosevkaTerm.zip
unzip IosevkaTerm.zip -d IosevkaTerm
cp IosevkaTerm/*.ttf ~/.local/share/fonts
rm -rf IosevkaTerm.zip IosevkaTerm

fc-cache
cd -

# Set Ubuntu Mono as the default
gsettings set org.gnome.desktop.interface monospace-font-name 'UbuntuMono Nerd Font 14'
