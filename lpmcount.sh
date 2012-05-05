#!/bin/bash

# Script qui compte le nombre de pages de documentation, le nombre de lignes de
# code, et fait des calculs…

# Lignes de documentation = lignes en tout dans lpm - lignes de code

TOTAL_LINES="$(find doc -iname "*.lpm" | xargs cat $1 | sed '/^$/d' | wc -l)"
CODE_LINES="$(sloccount src/ 2>/dev/null | \
                 grep "Total Physical Source" | \
		 sed "s/.*= //g"|sed "s/,//g")"
DOCUMENTATION_LINES=$(($TOTAL_LINES - $CODE_LINES))
DOCUMENTATION_PAGES=$(($DOCUMENTATION_LINES / 50))

#echo -e "Total line count:\t\t$TOTAL_LINES lines"
echo -e "Code line count:\t\t$CODE_LINES lines"
echo -e "Documentation page count:\t$DOCUMENTATION_PAGES pages"

# Pour rigoler, on affiche le coût du logiciel (un euro par ligne de
# documentation, 25 euros par ligne de code).
#
# Les coûts sont calculés en se basant sur les principes scientifiques et
# rigoureux suivants : 
#  - sloccount fait un calcul compliqué, mais qui revient toujours à multiplier
#    le nombre de lignes par $25.
#  - La documentation coûte de $50 à $100 par page. Sur une page de RFC
#    formatée en texte brut en 72 colonnes, quand on enlève les en têtes et
#    pieds de page, la page fait 50 lignes. En prenant le coût le plus bas de
#    la documentation, ça fait $1 la ligne.

CODE_LINE_COST=25
DOCUMENTATION_LINE_COST=1
CODE_COST=$(($CODE_LINES*$CODE_LINE_COST))
DOCUMENTATION_COST=$(($DOCUMENTATION_LINES*$DOCUMENTATION_LINE_COST))
COST=$(($DOCUMENTATION_COST+$CODE_COST))
echo -e "Code cost:\t\t\t\$$CODE_COST"
echo -e "Documentation cost:\t\t\$$DOCUMENTATION_COST"
echo -e "Total cost:\t\t\t\$$COST"

# Et maintenant, « l'effort ». Comment on calcule l'effort ? Avec la méthode
# COCOMO, de la même manière pour les lignes de code que pour les lignes de
# documentation. Par contre, on considère que la documentation demande 10% du
# travail de développement (c'est des chiffres réels de vrai boite, mais j'ai
# pas les sources). C'est pas vrai en programmation lettrée, mais une partie du
# travail de documentation est en fait compté dans les lignes de codes, qui
# reflètent la partie « conception ». On calcule pas la quantité de monde
# nécessaire par rapport à l'effort et au temps total, mais en ajoutant le
# nombre de personnes qu'il faudrait pour écrire le programme au nombre de
# personnes nécessaires à l'écriture de la doc. C'est plus logique comme ça,
# même si dans nos petites têtes, les deux calculs devraient donner le même
# résultat, mathématiquement, ça marche pas. C'est bien la preuve qu'on peut
# pas faire confiance à cette méthode…
export CODE_LINES DOCUMENTATION_LINES
python2 << EOF
import os
code_lines = int(os.getenv("CODE_LINES"))
doc_lines = int(os.getenv("DOCUMENTATION_LINES"))
code_effort = 2.4*((code_lines/1000.0)**1.05)
code_time = 2.5*(code_effort**0.38)
code_people = code_effort/code_time
doc_effort = 2.4*((doc_lines/1000.0)**1.05)
doc_time = 2.5*(doc_effort**0.38)
doc_people = doc_effort/doc_time
effort = code_effort+doc_effort*0.1
time = code_time+doc_time*0.1
people = code_people+doc_people*0.1

print "Time:\t\t\t\t{} man-month".format(round(time, 2))
print "People needed:\t\t\t{} developpers".format(round(people, 2))
EOF

