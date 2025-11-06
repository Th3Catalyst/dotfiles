if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

tempDir = pwd

updateDotfiles

clear

fastfetch

cd $tempDir