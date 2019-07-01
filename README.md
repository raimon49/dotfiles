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
    * IntelliJ IDEA
    * Visual Studio Code
    * Xcode
* Package Manager
    * Homebrew(macOS)
    * anyenv
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
