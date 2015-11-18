#!/usr/bin/env bash

brew cask install atom

# linting support
apm install linter
apm install linter-liferay
apm install linter-shellcheck
apm install linter-jsonlint
apm install linter-package-json-validator
apm install linter-jade
apm install linter-javac
apm install linter-jshint
apm install linter-pylint
apm install linter-less
apm install linter-stylint

# SCM support
apm install git-plus
