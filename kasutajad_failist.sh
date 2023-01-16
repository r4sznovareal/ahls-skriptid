#!/bin/bash

#skript, mis lisab kasutajaid failist
if [ $# -ne 1 ]; then #kui ei määrata parameetreid skriptile juurde, väljastatakse n-ö kasutusjuhend
        echo "Kasutusjuhend: $0 failinimi"
else
	failinimi=$1
	if [ -f $failinimi -a -r $failinimi ]; then
		echo "Fail on korras"
		for nimi in $(cat $failinimi) #loeb failist $failinimi kõik read läbi ja hiljem teeb 
		do
			#cat abil saab vaadata faili sisu, nüüd saab kasutajaid luua
			./lisa_kasutaja.sh $nimi #kasutaja loomise skripti käivitamine
		done
	else
		echo "Tekkis probleem failiga $failinimi"
	fi
#skripti lõpp
fi
