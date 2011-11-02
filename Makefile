
base: $(HOME)/.vim \
	$(HOME)/.vimrc \
	$(HOME)/.ssh/config \
	$(HOME)/.pentadactylrc \
	$(HOME)/.screenrc \
	$(HOME)/.ackrc \
	$(HOME)/.subversion \
	$(HOME)/.gitconfig \
	$(HOME)/.gitignore \
	$(HOME)/.bash \
	$(HOME)/.bashrc \
	$(HOME)/.bash_profile \
	$(HOME)/.zsh \
	$(HOME)/.zshrc \
	$(HOME)/.pentadactyl/info/default/quickmarks

$(HOME)/.%: %
	ln -fs $(abspath $<) $@

$(HOME)/.ssh/config: ssh_config
	mkdir -p $(HOME)/.ssh
	ln -fs $(abspath $<) $@

$(HOME)/.pentadactyl/info/default/quickmarks: pentadactyl/info/default/quickmarks
	mkdir -p $(HOME)/.pentadactyl/info/default
	ln -fs $(abspath $<) $@

ta-bash: ta/bash
	ln -fs $(abspath $<) $(HOME)/.bash/special

ta-zsh: ta/zsh
	ln -fs $(abspath $<) $(HOME)/.zsh/special

ta: ta-bash ta-zsh
