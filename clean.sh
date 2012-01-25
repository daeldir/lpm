#!/bin/sh

# Supprime les fichiers .clean
for i in $(find -iname "*.clean"); do
	rm $i
done

# Supprime les sources
if [[ -d src ]]; then
	rm -rvf src/
fi

# Supprime les fichiers HTML
for i in $(ls|grep "\.html"); do
        rm $i
done

