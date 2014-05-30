#!/usr/bin/python
import unicodedata
import sys
import codecs
import re

inp = sys.argv[1]
out = sys.argv[2]

with codecs.open(inp, encoding='utf-8') as f:
    data = f.read().splitlines()

outstr = '\n'.join([ re.sub(u'y(.)\u05b9', u'\u05e9\\1\u05c2', line) for line in data ])

with codecs.open(out, mode='w', encoding='utf-8') as f:
    f.write(outstr)
