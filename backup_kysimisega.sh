#!/bin/bash

#küsitakse kaust, mida tahetakse varundada:
echo -n "Sisestage kaust, mida soovite varundada: "
read lahtekaust

#kausta asukoht, kuhu varundatakse:
echo -n "Sisestage asukohta, kuhu soovite varundusfailid panna: "
read sihtkaust

#liigutakse lähtekausta, et oleks võimalik asukohas olevaid katalooge varundada
cd $lahtekaust

for filename in $(ls $lahtekaust); do
	if [ -f $filename ]; then #kui on tegemist failiga:
		echo "$filename is a regular file"
	else
		if [ -d $filename ]; then #kui on tegemist kaustaga:
			kuupaev=$(date +"%d.%m.%y") #kuupäev päev.kuu.aasta
			echo $kuupaev 
			echo "$failinimi on kaust, tehakse varukoopia asukohta $asukoht/$arhiivi_fail"
			tar -c -f $filename.$kuupaev.tar $filename/ #.tar faili loomine
			gzip $filename.$kuupaev.tar #gzip kokkupakkimine (.gz)
			mv $filename.$kuupaev.tar.gz $sihtkaust #faili liigutamine soovitud varunduskausta
		fi
	fi
done
