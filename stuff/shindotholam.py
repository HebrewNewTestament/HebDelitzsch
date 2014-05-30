#!/usr/bin/python
import unicodedata
import sys
import codecs

inp = sys.argv[1]
out = sys.argv[2]

with codecs.open(inp, encoding='utf-8') as f:
    data = f.read().splitlines()

outstr = '\n'.join([ line.replace(u'\u05d5'+u'\u05c1', u'\u05d5'+u'\u05b9') for line in data ])

with codecs.open(out, mode='w', encoding='utf-8') as f:
    f.write(outstr)
