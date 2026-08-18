#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""python -m hoscanner 入口。"""
import sys

from .scanner import main

if __name__ == "__main__":
    main(sys.argv[1:])
