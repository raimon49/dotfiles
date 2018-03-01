dotfiles
========

[![Build Status](https://travis-ci.org/raimon49/dotfiles.svg?branch=master)](https://travis-ci.org/raimon49/dotfiles)

my dotfiles

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
$ git clone --recursive git://github.com/raimon49/dotfiles.git
$ cd dotfiles
$ ./install_cui.sh
```
