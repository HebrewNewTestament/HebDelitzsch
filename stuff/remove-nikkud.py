#!/usr/bin/python

# Actually remove all 'Mark, Nonspacing'

import unicodedata
import sys
import codecs

inp = sys.argv[1]
out = sys.argv[2]

with codecs.open(inp, encoding='utf-8') as f:
    data = f.read().splitlines()
    outstr = '\n'.join(
        ''.join(
            c for c in line if unicodedata.category(c) != 'Mn'
        )
        for line in data
    )
    with codecs.open(out, mode='w', encoding='utf-8') as f:
        f.write(outstr)

