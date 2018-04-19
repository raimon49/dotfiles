#!/usr/bin/env python
# -*- coding: utf-8 -*-
# vim:fenc=utf-8 ff=unix ft=python ts=4 sw=4 sts=4 si et
from __future__ import (division, print_function,
                        absolute_import, unicode_literals)
import sys
import argparse
try:
    import configparser as ConfigParser
except ImportError:
    import ConfigParser
try:
    from urllib.request import urlopen, Request
    from urllib.error import HTTPError
except ImportError:
    from urllib2 import urlopen, Request, HTTPError


def parse_args():
    parser = argparse.ArgumentParser(
        description='script description')
    parser.add_argument('-v', '--version',
                        action='version',
                        version='%(prog)s 1.0.0')
    parser.add_argument('-n', '--dryrun',
                        action='store_true',
                        default=False,
                        help='dry run this script')

    return parser.parse_args()


def main():
    args = parse_args()
    if args.dryrun:
        sys.exit(0)

    {{_cursor_}}


if __name__ == '__main__':
    main()
