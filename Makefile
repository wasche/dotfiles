OS=$(shell ./bin/os.sh)
SUBLIME_PACKAGES_DIR=$(abspath config/sublime-text-2/Packages)
SUBLIME_SETTINGS_DIR=$(SUBLIME_PACKAGES_DIR)/User

ifeq ($(OS),ubuntu)
	SUBLIME_DIR=$(HOME)/.config/sublime-text-2
endif
ifeq ($(OS),macosx)
	SUBLIME_DIR=$(HOME)/Library/Application\ Support/Sublime\ Text\ 3
endif

SUBLIME_PACKAGES=$(SUBLIME_DIR)/Packages
SUBLIME_USER=$(SUBLIME_PACKAGES)/User

base: $(HOME)/.vim \
	$(HOME)/.vimrc \
	$(HOME)/.tmux.conf \
	$(HOME)/.todo.cfg \
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
	$(HOME)/bin \
	$(HOME)/.todo.actions.d \
	$(HOME)/.irssi
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

$(SUBLIME_USER)/%: $(SUBLIME_SETTINGS_DIR)/%
	ln -fs "$<" "$@"

$(SUBLIME_USER)/Default\ (OSX).sublime-keymap: $(SUBLIME_SETTINGS_DIR)/Default\ (OSX).sublime-keymap
	ln -fs "$<" "$@"

sublime-settings: $(SUBLIME_USER)/Preferences.sublime-settings \
	$(SUBLIME_USER)/JavaScript.sublime-settings \
	$(SUBLIME_USER)/SublimeLinter.sublime-settings \
	$(SUBLIME_USER)/CSS.sublime-settings \
	$(SUBLIME_USER)/HTML.sublime-settings \
	$(SUBLIME_USER)/Velocity.sublime-settings \
	$(SUBLIME_USER)/Plain.sublime-settings \
	$(SUBLIME_USER)/Default\ (OSX).sublime-keymap

$(SUBLIME_PACKAGES)/%: $(SUBLIME_PACKAGES_DIR)/%
	ln -fs "$<" "$@"

sublime-langs: $(SUBLIME_PACKAGES)/Velocity $(SUBLIME_PACKAGES)/Jade $(SUBLIME_PACKAGES)/Stylus

sublime: sublime-settings sublime-langs

