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
export PS1="\n\[\033[1m\033[32m\]─┬──┤ \[\033[37m\]\w \[\033[32m\]├───┤ \[\033[37m\]\u \[\033[32m\]├───┤ \[\033[37m\]\A \[\033[32m\]├───┤ \[\033[37m\]\#|\! \[\033[32m\]│ \n\[\033[1m\] └───┤\[\033[37m\]\$\[\033[32m\]│ \[\033[0m\]"

alias sps="sudo pacman -S"
alias ga="git add"
alias com="git commit -m"
alias ll='ls -l'
alias la='ls -la'
alias gpl='git pull origin'
alias gph='git push origin'
alias snvdrain='sudo nvidia-smi drain -p 0000:01:00.0 -m'
alias kdoc='kscreen-doctor'
alias sys='systemctl'
alias gr='grep'
alias nvrun='__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'


kdoc-mode() {
	OPTIND=1
	display=$1
	mode=$2
	kdoc output.$display.mode.$mode
}

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
    python ~/SCiPnet/SCiPnet.py

}
