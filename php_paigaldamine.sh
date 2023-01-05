#php paigaldusskript

#kontroll, kas php on installeeritud

PHP=$(dpkg-query -W -f='${Status}' php 2>/dev/null | grep -c 'ok installed')
#kui PHP väärtus võrdub 0-ga ehk puudub, käivitatakse käsud:
if [ $PHP -eq 0 ]; then
	#ok installed ei olnud leitud
	#väljastatakse teade ja paigaldatakse php
	echo "Php ja vajalike lisade paigaldamine"
	apt install php libapache2-mod-php php-mysql
	echo "Php on paigaldatud"
#kui PHP võrdub 1-ga, käivitatakse käsud:
elif [ $PHP -eq 1 ]; then
	#ok installed on leitud ehk php on juba paigaldatud
	echo "Php on juba paigaldatud"
	#olemasolu kontrollimine
	which php
#tingimuslause lõpetamine
fi
#skripti lõpp
