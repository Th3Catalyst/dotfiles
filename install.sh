install() {
    cd ~
    git clone "https://github.com/Th3Catalyst/dotfiles.git" ".dots"
    echo "Copying files..."
    cp ~/.dots/.nanorc ~/
    cp ~/.dots/.bash_profile ~/
    cp ~/.dots/.bashrc ~/
    echo "Copying complete"
    cd ~
    echo "Sourcing .bashrc..."
    source ~/.bashrc
    echo "Cleaning up..."
    rm ~/install.sh
    echo "Install complete"
}
