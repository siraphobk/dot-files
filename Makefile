stow-nvim-scripts:
	stow -R nvim -t ~/.config/nvim

stow-alacritty:
	stow -R .alacritty.yaml -t ~/.alacritty.yaml

vim-plug-nvim:
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
				 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

create-symlink-tmux-conf:
	ln -s ./.tmux.conf ~/.tmux.conf

	
