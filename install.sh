install() {
    cd ~
    git clone "https://github.com/Th3Catalyst/dotfiles.git"
    echo "Copying files..."
    scp -vvv ~/dotfiles/.nanorc ~/
    scp -vvv ~/dotfiles/.bash_profile ~/
    scp -vvv ~/dotfiles/.bashrc ~/
    echo "Copying complete"
    cd ~
    echo "Sourcing .bashrc..."
    source ~/.bashrc
    echo "Cleaning up..."
    rm ~/install.sh
    echo "Install complete"
}
