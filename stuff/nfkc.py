#!/usr/bin/python
import unicodedata
import sys
import codecs

inp = sys.argv[1]
out = sys.argv[2]

with codecs.open(inp, encoding='utf-8') as f:
    data = f.read().splitlines()

outstr = '\n'.join([ unicodedata.normalize('NFKC', line) for line in data ])

with codecs.open(out, mode='w', encoding='utf-8') as f:
    f.write(outstr)
