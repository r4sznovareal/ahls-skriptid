#!/bin/bash

#skript, mis lisab masinasse uue kasutaja ja loob selle jaoks eraldi kataloogi kasutades parameetreid

if [ $# -ne 1 ]; then
	echo "Kasutusjuhend: $0 kasutajanimi"
else
	kasutajanimi=$1
	useradd $kasutajanimi -m -s /bin/bash

	#käsu kontrollimine, kas töötas või mitte
	if [ $? -eq 0 ]; then
		echo "Kasutaja nimega $kasutajanimi on lisatud süsteemi"
		cat /etc/passwd | grep $kasutajanimi
		ls -la /home/$kasutajanimi
	else
		echo "Tekkis probleem kasutaja $kasutajanimi lisamisega"
		echo "Probleemi kood on $?"
	fi
#skripti lõpp
fi
