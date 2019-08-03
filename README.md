dotfiles
========

[![Build Status](https://travis-ci.org/raimon49/dotfiles.svg?branch=master)](https://travis-ci.org/raimon49/dotfiles)

my dotfiles

Tools
-----

* Shell
    * Zsh
    * Bash
* Editor
    * Vim/Neovim
* IDE
    * Eclipse with Vrapper
    * IntelliJ IDEA with IdeaVim
    * Visual Studio Code with VSCodeVim
    * Xcode with XVim2
* Package Manager
    * Homebrew(macOS)
    * anyenv
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
$ git clone --recursive https://github.com/raimon49/dotfiles.git
$ cd dotfiles
$ ./install_cui.sh
```
