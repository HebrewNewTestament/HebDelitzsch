#!/usr/bin/python

import fileinput
import unicodedata
import codecs

for line in fileinput.input():
    for c in unicode(line, encoding='UTF-8'):
        try:
            print repr(c), unicodedata.name(c)
        except ValueError:
            print repr(c), 'No Name'

