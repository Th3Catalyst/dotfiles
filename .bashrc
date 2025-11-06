scipnet() {
    cd ~/scipnet
    python scipnet.py
}

updateDotfiles() {
    cd ~/dotfiles
    echo "Pulling..."
    git pull
    echo "Copying files..."
    scp -vvv ~/dotfiles/.nanorc ~/
    scp -vvv ~/dotfiles/.bash_profile ~/
    scp -vvv ~/dotfiles/.bashrc ~/
    echo "Sourcing..."
    source .bashrc
}


NRR() {
    cloneURL = $1
    help = 'f'
    repoName = ""
    branchName = "main"
    while getopts "hf:b:" arg; do
        case $arg in
            h) help = 't' ;;
            n) repoName=$OPTARG ;;
            b) branchName=$OPTARG ;;
        esac
    done
    if [$help == 't'] then
        printf "Usage: NRR [-h] <URL> [-n <repo name>] [-b <branch name>] \nCreate a new local clone of a github repository.\n\t-h \t\t\t displays this help text.\n\t-n \t\t\t the name of the folder in which to put the repository.\n\t   \t\t\t defaults to the name of the github repository.\n\t-b \t\t\t branch name you want to clone.\n\t   \t\t\t defaults to main."
        return
    fi
    if [$# -eq 0]; then
        echo "The NRR function takes 1 argument, but 0 were given."
        return
    else
        
        if [ $cloneURL =~ ^https://github.com/[^/]+/([\.]+).git]
            
            if [! $repoName == '']; then
                repoName = ${BASH_REMATCH[1]}
            mkdir $repoName
            cd $repoName
            git init
            git remote add origin $cloneURL
            git pull origin $branchName
            return

        else
            echo "invalid git URL"
            return
        fi
    fi
}