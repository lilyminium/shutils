# shutils
Shell utilities for Zsh and Bash

```bash

git clone https://github.com/lilyminium/shutils.git
cd shutils
cwd=$(pwd)

if [ -f ~/.zshrc ] ; then
    for file in aliases.sh func.sh git.sh zshsys.sh; do
        echo "source ${cwd}/${file}" >> ~/.zshrc
    done
    echo "unsetopt share_history" >> ~/.zshrc
    RCFILE="~/.zshrc"
fi

if [ -f ~/.bashrc ] ; then
    for file in aliases.sh func.sh git.sh; do
        echo "source ${cwd}/${file}" >> ~/.bashrc
    done
    RCFILE="~/.bashrc"
fi

if [ "$(uname)" == "Darwin" ]; then echo "source ${cwd}/mac.sh" >> $RCFILE; fi

```