#!/usr/bin/env python3

from gensim.corpora import WikiCorpus
from sys import argv

wiki = WikiCorpus(argv[1])

with open(argv[2], 'w') as dump_file:
    for text in wiki.get_texts():
        dump_file.write(bytes(' '.join(text), 'utf-8').decode('utf-8') + '\n')
