stow-nvim-scripts:
	stow -R nvim -t ~/.config/nvim
stow-alacritty:
	stow -R .alacritty.yaml -t ~/.alacritty.yaml

WORKING_DIR=$(shell pwd)
symlink-tmux-conf:
	ln -s $(WORKING_DIR)/.tmux.conf ~/.tmux.conf

install: install-ripgrep install-tmux install-xclip
install-ripgrep:
	sudo apt install ripgrep
install-tmux:
	sudo apt install tmux
install-xclip:
	sudo apt install xclip
