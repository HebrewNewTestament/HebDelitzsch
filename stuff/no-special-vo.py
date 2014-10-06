#!/usr/bin/python
import unicodedata
import sys
import codecs
import re

inp = sys.argv[1]
out = sys.argv[2]

with codecs.open(inp, encoding='utf-8') as f:
    data = f.read().splitlines()

outstr = '\n'.join([ re.sub(u'\u05d5\u05ba', u'\u05d5\u05b9', line) for line in data ])

with codecs.open(out, mode='w', encoding='utf-8') as f:
    f.write(outstr)
