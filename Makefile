OS=$(shell ./bin/os.sh)
INTELLIJ_SETTINGS_DIR=$(abspath IntelliJIdea)
INTELLIJ_VER=15

ifeq ($(OS),ubuntu)
endif
ifeq ($(OS),macosx)
	INTELLIJ_PREFS=$(HOME)/Library/Preferences/IntelliJIdea$(INTELLIJ_VER)
endif

base: $(HOME)/.config \
	$(HOME)/.vim \
	$(HOME)/.vimrc \
	$(HOME)/.tmux.conf \
	$(HOME)/.todo.cfg \
	$(HOME)/.jshintrc \
	$(HOME)/.screenrc \
	$(HOME)/.ackrc \
	$(HOME)/.subversion \
	$(HOME)/.gitconfig \
	$(HOME)/.gitignore \
	$(HOME)/.bash \
	$(HOME)/.bashrc \
	$(HOME)/.bash/os.bash \
	$(HOME)/.bash_profile \
	$(HOME)/.zsh \
	$(HOME)/.zshrc \
	$(HOME)/.zsh/os.zsh \
	$(HOME)/bin \
	$(HOME)/lib \
	$(HOME)/.todo.actions.d \
	intellij

$(HOME)/.%: %
	ln -fs $(abspath $<) $@

$(HOME)/.config: config
	ln -fs $(abspath $<) $@
	mkfifo ~/.config/pianobar/ctl

$(HOME)/bin: bin
	ln -fs $(abspath $<) $@

$(HOME)/lib: lib
	ln -fs $(abspath $<) $@

$(HOME)/.bash/os.bash: bash/os/$(OS).bash
	ln -fs $(abspath $<) $@

$(HOME)/.zsh/os.zsh: zsh/os/$(OS)/os.zsh
	ln -fs $(abspath $<) $@

$(INTELLIJ_PREFS): $(INTELLIJ_SETTINGS_DIR)
	ln -fs "$<" "$@"

intellij: $(INTELLIJ_PREFS)
