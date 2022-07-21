all: apt-update install-deps copy-vimscripts

apt-update:
	sudo apt update

install-deps: vim-plug \
	nodejs \
	flake8 \
	exuberant-ctags

.PHONY: vim-plug
vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: nodejs
nodejs:
	curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -

.PHONY: flake8
flake8:
	sudo apt install python3-pip
	pip install flake8

.PHONY: exuberant-ctags
exuberant-ctags:
	sudo apt install -y exuberant-ctags

CWD=$(shell pwd)
copy-vimscripts:
	stow -R .vim -t ~


