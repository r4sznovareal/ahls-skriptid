#!/bin/bash

#küsitakse kausta nime, mille kaustad ära varuntadatakse:
echo -n "Sisestage kausta nimi, mille kaustad soovite ära varundada: "
read lahtekaust

#küsitakse kausta nime, kuhu tahetakse varundatud kataloogid tõsta:
echo -n "Sisestage kausta nimi, kuhu soovite varundatud kaustad luua: "
read sihtkaust

#liigutakse lähtekausta, et oleks võimalik kataloogi sees olevad kataloogid kokku pakkida, mitte kataloogi asukoht ise
cd $lahtekaust

if [ ! -d $sihtkaust ]; then #kui sihtkausta ei ole olemas, loodakse kaust, vajadusel terve asukoht
	echo "Valitud lähtekausta ei eksisteeri, luuakse kaust $sihtkaust"
	mkdir -p $sihtkaust
fi

for filename in $(ls $lahtekaust); do #loetakse lähtekaustast kataloogid ja failid
	if [ -f $filename ]; then #kui on tegemist failiga, ei varundata
		echo "$filename on fail, ei varundata"
	else
		if [ -d $filename ]; then #kui tegemist on kaustaga, varundatakse see
			echo "$filename on kaust, varundatakse asukohta $sihtkaust"
			kuupaev=$(date +"%d.%m.%y") #arhiveerimiseks luuakse kuupäev kujul päev.kuu.aasta
			tar -c -f $filename.$kuupaev.tar $filename/ #tar käsuga pakitakse kataloogi haaval kataloogid kokku
			gzip $filename.$kuupaev.tar #gzip (.gz)
			mv $filename.$kuupaev.tar.gz $sihtkaust #liigutatakse loodud .tar.gz fail sihtkausta
		fi
	fi
done

kodukaust=$(echo `pwd` | cut -d"/" -f2) #kodukausta muutuja loomine

if [ $kodukaust="home" ]; then #kui $kodukaust tulemuseks on "home":
        omanik=$(echo `pwd` | cut -d"/" -f3) #kataloogi omanik on pwd käsu kolmas osa ehk kodukataloogi kasutaja
        chown -R -v `echo $omanik` $sihtkaust #muudetakse kataloogi õigused, et kasutaja oleks kausta ja varundatud failide omanik
fi

