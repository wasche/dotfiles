OS=$(shell ./os.sh)
SUBLIME_SETTINGS_DIR=$(abspath config/sublime-text-2/Packages/User)

ifeq ($(OS),ubuntu)
	SUBLIME_DIR = $(HOME)/.config/sublime-text-2
endif

SUBLIME_TARGET=$(SUBLIME_DIR)/Packages/User

base: $(HOME)/.vim \
	$(HOME)/.vimrc \
	$(HOME)/.jshintrc \
	$(HOME)/.ssh/config \
	$(HOME)/.pentadactylrc \
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
	$(HOME)/.pentadactyl/info/default/quickmarks \
	$(HOME)/bin
	mkdir -p $(HOME)/.node-completion

$(HOME)/.%: %
	ln -fs $(abspath $<) $@

$(HOME)/.ssh/config: ssh_config
	mkdir -p $(HOME)/.ssh
	ln -fs $(abspath $<) $@

$(HOME)/.pentadactyl/info/default/quickmarks: pentadactyl/info/default/quickmarks
	mkdir -p $(HOME)/.pentadactyl/info/default
	ln -fs $(abspath $<) $@

$(HOME)/.bash/os.bash: bash/os/$(OS).bash
	ln -fs $(abspath $<) $@

$(HOME)/.zsh/os.zsh: zsh/os/$(OS)/os.zsh
	ln -fs $(abspath $<) $@

ta-bash: ta/bash
	ln -fs $(abspath $<) $(HOME)/.bash/special

ta-zsh: ta/zsh
	ln -fs $(abspath $<) $(HOME)/.zsh/special

$(HOME)/.bash/special/os.bash: ta/bash/os/$(OS).bash
	ln -fs $(abspath $<) $@

$(HOME)/.zsh/special/os.zsh: ta/zsh/os/$(OS).zsh
	ln -fs $(abspath $<) $@

ta: ta-bash ta-zsh $(HOME)/.bash/special/os.bash $(HOME)/.zsh/special/os.zsh

sublime:
	ln -fs "$(SUBLIME_SETTINGS_DIR)/Preferences.sublime-settings" "$(SUBLIME_TARGET)/Preferences.sublime-settings"
	ln -fs "$(SUBLIME_SETTINGS_DIR)/JavaScript.sublime-settings" "$(SUBLIME_TARGET)/JavaScript.sublime-settings"
	ln -fs "$(SUBLIME_SETTINGS_DIR)/SublimeLinter.sublime-settings" "$(SUBLIME_TARGET)/SublimeLinter.sublime-settings"
	ln -fs "$(SUBLIME_SETTINGS_DIR)/velocity syntax.sublime-settings" "$(SUBLIME_TARGET)/velocity syntax.sublime-settings"
	ln -fs "$(SUBLIME_SETTINGS_DIR)/Plain text.sublime-settings" "$(SUBLIME_TARGET)/Plain text.sublime-settings"

