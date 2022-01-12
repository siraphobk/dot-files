install: lib-update \
	i-prime-debian \
	i-docker \
	i-vimplug \
	i-vscode \
	i-tmux \
	i-grc

lib-update:
	apt update

i-prime-debian:
	apt install -y curl git nmap build-essential

i-docker:
	apt purge docker-ce docker-ce-cli containerd.io
	apt install ca-certificates curl gnupg lsb-release	
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
	apt update
	apt install docker-ce docker-ce-cli containerd.io

i-vimplug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

i-vscode:
	apt install -y code

i-tmux:
	apt install -y tmux

i-zsh:
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

i-grc:
	apt install -y grc

