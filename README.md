# Ahls-skriptid (Automatiseerib korduvad Haldustegevused Linux operatsioonisüsteemides, kasutades Skriptimisvahendeid)

## Automaatne teenuste paigaldamine
  - [Apache2 veebiserver installeerimine](../master/autoapacheweb.sh)
  - [MySQL andmebaasi serveri paigaldamine](../master/mysql_paigaldamine.sh)
  - [php ja vajalike moodulite paigaldamine](../master/php_paigaldamine.sh)
  - [phpMyAdmin paigaldamine koos teiste vajalike teenustega/serveritega (MySQL, Apache2, php moodulid)](../master/pma_paigaldus.sh)
  - [WordPressi paigaldamine koos teiste vajalike teenustega/serveritega (MySQL, Apache2, php moodulid)](../master/wordpress_paigaldus.sh)

## Automatiseeritud kasutajate haldus ja loomine
  - [Kasutajate lisamine koos kodukataloogiga parameetri abil](../master/lisa_kasutaja.sh)
  - [Kasutajate lisamine failist](../master/kasutajad_failist.sh)

##### Skriptide käivitamine/kasutamine
Enamus bash skriptide puhul toimub käivitamine niiviisi:
```
chmod +x <skripti failinimi> #õiguste määramine skripti käivitamiseks
./<skripti failinimi, vajadusel koos asukohaga> #skripti käivitamine 1
sh <skripti failinimi, vajadusel koos asukohaga> #skripti käivitamine 2
```

# Litsents
See projekt on litsenseeritud MIT Litsensi all - [LICENSE.md](LICENSE.md)
