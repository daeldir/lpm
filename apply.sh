#!/bin/sh

# Ce script remplace tout les fichiers par leur version nettoyée. Ne l'utilisez
# que si vous êtes certains que les fichiers ont été correctement parsés, ou
# vous risqueriez de perdre des informations !
for i in $(find -iname "*.clean"|sed "s/\.clean//g"); do
	mv $i.clean $i
done
