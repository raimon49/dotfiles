dotfiles
========

[![Build Status](https://github.com/raimon49/dotfiles/workflows/Acceptance%20test/badge.svg)](https://github.com/raimon49/dotfiles/actions?query=workflow%3A%22Acceptance+test%22)

my dotfiles

Table of Contents
-----------------

* [Tools](#tools)
* [Supported platforms](#supported-platforms)
* [Installation](#installation)
    * [Use curl](#use-curl)
    * [Use wget](#use-wget)
    * [Manually](#manually)

Tools
-----

* Shell
    * Zsh
    * Bash
* Editor
    * Vim 8 or later/Neovim
* IDE
    * Eclipse with Vrapper
    * IntelliJ IDEA with IdeaVim
    * Visual Studio Code with VSCodeVim
    * Xcode with XVim2
* Package Manager
    * Homebrew(macOS, Linux)
    * antigen
    * asdf-vm
    * dein.vim
* Python
    * pip
    * PyPI/TestPyPI
* RDBMS
    * MySQL
* Terminal Multiplexer
    * GNU Screen
* Version Control System
    * Git
    * Mercurial
    * Subversion

Supported platforms
-------------------

* BSD
    * macOS
    * FreeBSD
* Linux
    * CentOS
    * RHEL
    * Rocky Linux
    * Ubuntu

Installation
------------

One-liner or manual installation is provided.

### Use curl

```bash
$ curl -s https://raw.githubusercontent.com/raimon49/dotfiles/master/bootstrap.sh | sh
```

### Use wget

```bash
$ wget -q -O - https://raw.githubusercontent.com/raimon49/dotfiles/master/bootstrap.sh | sh
```

### Manually

```bash
$ mkdir -p ~/works/git
$ cd ~/works/git
$ git clone --recursive --depth 5 https://github.com/raimon49/dotfiles.git
$ cd dotfiles
$ ./install_cui.sh
```
