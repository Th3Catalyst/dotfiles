if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist

# auto complete command from history
export INPUTRC=~/.inputrc

# 256 bit colors
export TERM=xterm-256color


udf() {
    temp=${pwd}
    cd ~/dotfiles
    echo "Pulling..."
    git pull
    echo "Copying files..."
    scp -v ~/dotfiles/.nanorc ~/
    scp -v ~/dotfiles/.bash_profile ~/
    scp -v ~/dotfiles/.bashrc ~/
    echo "Sourcing..."
    source ~/.bashrc
    cd $temp
}

dont() {
    for i in {1..100}
    do
    open -a Terminal .
    done
}

nrr() {
    OPTIND=1
    help='f'
    repoName=""
    branchName="main"

    while getopts 'hn:b:' arg; do
        case "$arg" in
            h)
                help='t'
                ;;
            n)
                repoName="$OPTARG"
                ;;
            b)
                branchName="$OPTARG"
                ;;
        esac
    done
    shift $((OPTIND - 1))
    cloneURL=$1
    if [[ $help == 't' ]]; then
        printf "Usage: NRR [-h] <URL> [-n <repo name>] [-b <branch name>] \nCreate a new local clone of a github repository.\n\t-h \t\t\t displays this help text.\n\t-n \t\t\t the name of the folder for the repository.\n\t   \t\t\t defaults to the name of the github repository.\n\t-b \t\t\t branch name you want to clone.\n\t   \t\t\t defaults to main."
        return
    fi
    if [ $# -eq 0 ]; then
        echo "The NRR function takes 1 argument, but 0 were given."
        return
    else
        
        if [[ $cloneURL =~ ^https://github.com/[^/]+/([^\.]+).git$ ]]; then
            
            if [[ "${repoName}" == "" ]]; then
                repoName=${BASH_REMATCH[1]}
            fi
            mkdir $repoName
            cd $repoName
            git init
            git remote add origin $cloneURL
            git pull origin $branchName
            git checkout $branchName
            return


        else
            echo "invalid git URL"
            return
        fi
    fi
}

scipnet() {
    cd ~/scipnet
    python scipnet.py
}

alias la='ls -la'
alias gp='git pull origin'
