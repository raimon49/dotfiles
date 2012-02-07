#!/usr/bin/env python
# coding: utf-8

import sys

if __name__ == '__main__':
    sys.path.insert(0, 'paver/paver-minilib.zip')
    import paver.tasks
    paver.tasks.main()
    sys.exit()

from paver.easy import *

@task
def install_gui():
    '''install vimfiles for Windows'''
    # TODO implement
    pass
