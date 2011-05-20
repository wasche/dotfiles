
base: $(HOME)/.vim \
	$(HOME)/.vimrc \
	$(HOME)/.ssh/config \
	$(HOME)/.pentadactylrc \
	$(HOME)/.screenrc \
	$(HOME)/.ackrc \
	$(HOME)/.subversion \
	$(HOME)/.bash \
	$(HOME)/.bashrc \
	$(HOME)/.zsh \
	$(HOME)/.zshrc

$(HOME)/.%: %
	ln -fs $(abspath $<) $@

$(HOME)/.ssh/config: ssh_config
	mkdir -p $(HOME)/.ssh
	ln -fs $(abspath $<) $@

ta-bash: ta/bash
	ln -fs $(abspath $<) $(HOME)/.bash/ta

ta-zsh: ta/zsh
	ln -fs $(abspath $<) $(HOME)/.zsh/ta

ta-bashrc: ta/bashrc
	ln -fs $(abspath $<) $(HOME)/.bash/special

ta-zshrc: ta/zshrc
	ln -fs $(abspath $<) $(HOME)/.zsh/special

ta: ta-bash ta-bashrc ta-zsh ta-zshrc
