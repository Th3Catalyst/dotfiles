if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

export CURRENT_DIRECTORY=$(pwd)

udf

clear

fastfetch

cd $CURRENT_DIRECTORY