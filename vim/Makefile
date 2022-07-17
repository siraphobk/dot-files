setup-vim: vim-plug nodejs flake8

.PHONY: vim-plug
vim-plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

.PHONY: nodejs
nodejs:
	curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -

.PHONY: flake8
flake8:
	sudo apt install python3-pip
	pip install flake8
