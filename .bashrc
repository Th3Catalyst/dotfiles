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
export PS1="\w : \u : \A : \#|\! \$ "

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
    for i in {1..200}
    do
    open -a Terminal .
    echo -ne '\007'
    done
}

mkcd() {
	OPTIND=1
	directory=$1
	mkdir $directory
	cd $directory
}

nrr() {
    OPTIND=1
    help='f'
    push='f'
    repoName=""
    branchName="main"

    while getopts 'hn:b:' arg; do
        case "$arg" in
            h)
                help='t'
                ;;
	    p)
		push='t'
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
        printf "Usage: NRR [-h] <URL> [-n <repo name>] [-b <branch name>] \nCreate a new local clone of a github repository.\n\t-h \t\t\t displays this help text.\n\t-n \t\t\t the name of the folder for the repository.\n\t   \t\t\t defaults to the name of the github repository.\n\t-b \t\t\t branch name you want to clone.\n\t   \t\t\t defaults to main.\n"
        return
    fi
    if [ $# -eq 0 ]; then
        echo "The NRR function takes 1 argument, but 0 were given."
        return
    elif [[ $push == 't' ]]; then
        if [[ $cloneURL =~ ^https://github.com/[^/]+/([^\.]+).git$ ]]; then
            
            git init
            git remote add origin $cloneURL
            git branch -M $branchName
	    git add .
	    git commit -m "initial commit"
	    git push -u origin $branchName
            return

        else
            echo "invalid git URL"
            return
        fi
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
    cd ~/scipnet/scipnet.py
}
alias sps="sudo pacman -S"
alias ga="git add"
alias com="git commit -m"
alias la='ls -la'
alias gpl='git pull origin'
alias gph='git push origin'
