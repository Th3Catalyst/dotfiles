scipnet() {
    cd ~/scipnet
    python scipnet.py
}

updateDotfiles() {
    tempDir = pwd
    cd ~/dotfiles
    echo "Pulling..."
    git pull
    echo "Copying files..."
    scp -vvv ~/dotfiles/.nanorc ~/
    scp -vvv ~/dotfiles/.bash_profile ~/
    scp -vvv ~/dotfiles/.bashrc ~/
    cd $tempDir
    echo "Sourcing..."
    source .bashrc
}


nlr() {
    echo "test"
}