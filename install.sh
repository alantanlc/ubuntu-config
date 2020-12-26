# VARIABLES
NAME="Alan Tan"
EMAIL="alanwuha91@gmail.com"

# APT
sudo apt update -y
sudo apt upgrade -y

# SSH key (Add the SSH key to GitHub account after generating)
if [[ ! -e ~/.ssh/id_ed25519 ]]; then
    ssh-keygen -t ed25519 -C $EMAIL
    eval "$(ssh-agent) -s)"
    ssh-add ~/.ssh/id_ed25519
fi

# GIT
git config --global user.name = $NAME
git config --global user.email = $EMAIL
git config --global alias.hs "log --pretty='%C(yellow)%h %C(cyan)%ad %C(magenta)%an%C(auto)%d %Creset%s' --date=relative --date-order --graph"

# ZSH
sudo apt install zsh -y

# OH-MY-ZSH (Execute `sudo vim /etc/passwd' and modify ubuntu user shell path to /usr/bin/zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# ZSH AUTOSUGGESTIONS (Add `plugins=(zsh-suggestions)` to .zshrc)
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# VIM
cp .vimrc ~/.vimrc

# NERDTREE
mkdir -p ~/.vim/pack/vendor/start
git clone --depth 1 https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree

# GH (Log in using `gh auth login` after installing)
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
sudo apt-add-repository https://cli.github.com/packages
sudo apt update
sudo apt install gh

