if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export CURRENT_DIRECTORY=$(pwd)

updateDotfiles

clear

fastfetch

cd $CURRENT_DIRECTORY