install() {
    cd ~
    mkdir temp
    cd temp
    git clone "https://github.com/Th3Catalyst/dotfiles.git"
    echo "Copying files..."
    scp -vvv ~/temp/dotfiles/.nanorc ~/
    scp -vvv ~/temp/dotfiles/.bash_profile ~/
    echo "Copying complete"
    cd ~
    echo "Cleaning up..."
    rm -rf temp
}