#!/bin/bash

ebook-convert $1_epub_ready.html $1.epub --no-default-epub-cover
sigil $1.epub

