#!/usr/bin/env python
# -*- coding: gbk -*-


###########################################  
# File Name     : file.py
# Author        : liqibo(qibolee@163.com)
# Created Time  : 2017/9/10
# Brief         : static
###########################################


__revision__ = '0.1'
import sys


def run(path_1):

    for line in sys.stdin:
        # '\t': 
        line = line.strip()
        ll = map(lambda x:x.strip(), line.split("\t"))
        if len(ll) != 2:
            continue

    return 0


def main(path_1):
    """
    statement
    """
    exit(run(path_1))


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print >> sys.stderr, "error argv: python %s path_1" % sys.argv[0]
        exit(1)
    main(sys.argv[1])



