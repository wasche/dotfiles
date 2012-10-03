OS=$(shell ./bin/os.sh)
SUBLIME_PACKAGES_DIR=$(abspath config/sublime-text-2/Packages)
SUBLIME_SETTINGS_DIR=$(SUBLIME_PACKAGES_DIR)/User

ifeq ($(OS),ubuntu)
	SUBLIME_DIR=$(HOME)/.config/sublime-text-2
endif
ifeq ($(OS),macosx)
	SUBLIME_DIR=$(HOME)/Library/Application\ Support/Sublime\ Text\ 2
endif

SUBLIME_PACKAGES=$(SUBLIME_DIR)/Packages
SUBLIME_USER=$(SUBLIME_PACKAGES)/User

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

$(HOME)/bin: bin
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

$(SUBLIME_USER)/%.sublime-settings: $(SUBLIME_SETTINGS_DIR)/%.sublime-settings
	ln -fs "$<" "$@"

sublime-settings: $(SUBLIME_USER)/Preferences.sublime-settings \
	$(SUBLIME_USER)/JavaScript.sublime-settings \
	$(SUBLIME_USER)/SublimeLinter.sublime-settings \
	$(SUBLIME_USER)/CSS.sublime-settings \
	$(SUBLIME_USER)/HTML.sublime-settings \
	$(SUBLIME_USER)/velocity\ syntax.sublime-settings \
	$(SUBLIME_USER)/Plain\ text.sublime-settings \

$(SUBLIME_PACKAGES)/%: $(SUBLIME_PACKAGES_DIR)/%
	ln -fs "$<" "$@"

sublime-langs: $(SUBLIME_PACKAGES)/Velocity

sublime: sublime-settings sublime-langs

