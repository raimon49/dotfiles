#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import argparse


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
