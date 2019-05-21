#1/bin/bash

#tablice przechowujace bilety i ceny (nazwa i cena w osobnych tableach maja ten sam indeks - tym sa powiazane w skrypcie)
ulgowy_miasto=("ulgowy jednoprzejazdowy miasto" "ulgowy dwuprzejazdowy miasto" "ulgowy czasowy 20 minutowy miasto" "ulgowy czasowy 40 minutowy miasto" "ulgowy czasowy 60 minutowy miasto" "ulgowy czasowy 90 minutowy miasto" "ulgowy czasowy 24 godziny miasto" "ulgowy czasowy 48 godziny miasto" "ulgowy czasowy 72 godziny miasto" "ulgowy czasowy 7 dniowy miasto" "ulgowy jednoprzejazdowy dla grupy 20 os miasto")
ulgowy_miasto_price=(1.90 3.60 1.40 1.90 2.50 3.00 7.50 12.00 18.00 24.00 18.00)
normalny_miasto=("normalny jednoprzejazdowy miasto" "normalny dwuprzejazdowy miasto" "normalny czasowy 20 minutowy miasto" "normalny czasowy 40 minutowy miasto" "normalny czasowy 60 minutowy miasto" "normalny czasowy 90 minutowy miasto" "normalny czasowy 24 godzinny miasto" "normalny czasowy 48 godzinny miasto" "normalny czasowy 72 godzinny miasto" "normalny czasowy 7 dniowy miasto" "normalny weekendowy miasto" "normalny jednoprzejazdowy dla grupy 20 os miasto")
normalny_miasto_price=(3.80 7.20 2.80 3.80 5.00 6.00 15.00 24.00 36.00 48.00 16.00 36.00)
ulgowy_aglo=("ulgowy jednoprzejazdowy aglomeracja" "ulgowy dwuprzejazdowy aglomeracja" "ulgowy czasowy 60 minutowy aglomeracja" " ulgowy czasowy 90 minutowy aglomeracja" "algowy czasowy 24 godzinny aglomeracja" "ulgowy 7 dniowy aglomeracja" "ulgowy jednoprzejazdowy dla grupy 20 os aglomeracja" "ulgowy wspolny aglomeracja")
ulgowy_aglo_price=(2.00 3.80 2.50 3.00 10.00 31.00 23.00 2.70)
normalny_aglo=("normalny jednoprzejazdowy aglomeracja" "normalny dwuprzejazdowy aglomeracja" "normalny czasowy 60 minutowy aglomeracja" "noramlny czasowy 90 minutowy aglomeracja" "normalny czasowy 24 godzinny aglomeracja" "normalny 7 dniowy aglomeracja" "normalny weekendowy aglomeracja" "noramlny jednoprzejazdowy dla grupy 20 os aglomeracja" "normalny wspolny aglomeracja")
normalny_aglo_price=(4.00 7.60 5.00 6.00 20.00 62.00 16.00 46.00 5.40)

#tablice przechowujace bilety i ceny KKM
ulgowy_miasto_KKM=("ulgowy imienny na 1 linie miasto" "ulgowy imienny na 2 linie miasto" "ulgowy imienny sieciowy miasto" "ulgowy semestralny imienny miasto")
ulgowy_miasto_KKM_price=(23.00 32.00 44.50 184.00)
normalny_miasto_KKM=("normalny imienny na 1 linie miasto" "normalny imienny na 2 linie miasto" "normalny imienny sieciowy miasto" "normalny na okaziciela miasto" "normalny socjalny imienny miasto" "normalny aktywizujacy imienny miasto")
normalny_miasto_KKM_price=(46.00 64.00 89.00 152.00 29.00 50.00)
ulgowy_aglo_KKM=("ulgowy imienny na 1 linie aglomeracyjny" "ulgowy imienny na 2 linie aglomeracyjny" "ulgowy imienny sieciowy aglomeracyjny" "ulgowy semestralny imienny aglomeracyjny")
ulgowy_aglo_KKM_price=(35.00 39.00 70.00 275.00)
normalny_aglo_KKM=("normalny imienny na 1 linie aglomeracyjny" "normalny imienny na 2 linie aglomeracyjny" "normalny imienny sieciowy aglomeracyjny" "normalny na okaziciela aglomeracyjny" "normalny socjalny imienny aglomeracyjny" "normalny aktywizujacy imienny aglomeracyjny")
normalny_aglo_KKM_price=(70.00 78.00 140.00 200.00 46.00 100.00)

#tablica przechowujaca linie (do wyboru dla zerowego i pierwszego indexu tabel przechowujacych bilety KKM (bilety liniowe))
linie_miasto=(1 2 3 5 6 9 10 11 14 16 17 18 19 21 22 24 50 52 62 69 73 74 78 100 101 102 103 105 107 109 110 111 112 113 114 116 117 120 122 123 124 125 127 128 129 130 131 132 133 134 137 138 139 141 142 143 144 149 151 152 154 158 159 160 161 162 163 164 166 168 169 171 172 173 174 157 178 179 181 182 183 184 192 193 194 405 413 422 424 429 451 469 475 478 482 484 501 502 503 511 537 572 601 605 608 610 611 612 637 642 643 662 664 669)
linie_aglo=(201 202 203 204 207 208 209 210 211 212 213 214 215 217 218 219 220 221 222 223 224 225 226 227 229 230 232 233 235 237 238 239 240 242 243 244 245 247 248 249 250 252 253 255 257 258 259 260 263 264 265 267 268 269 270 271 273 274 275 277 278 280 283 285 287 297 301 304 902 903 904 910 915 917 920 937)

#do zamiany numeru na nazwe miesiaca, numer miesiaca przekazywany jako parametr
wyswietl_miesiac(){
nr=$1
rok=$(date '+%Y')
if [ $nr -gt "12" ] ; then
	nr=$(($nr-12))
	rok=$(($rok+1))
fi
case $nr in
"1") echo "styczen $rok" ;;
"2") echo "luty $rok" ;;
"3") echo "marzec $rok" ;;
"4") echo "kwiecien $rok" ;; 
"5") echo "maj $rok" ;;
"6") echo "czerwiec $rok" ;;
"7") echo "lipiec $rok" ;;
"8") echo "sierpien $rok" ;;
"9") echo "wrzesien $rok" ;;
"10") echo "pazdziernik $rok" ;;
"11") echo "listopad $rok" ;;
"12") echo "grudzien $rok" ;;
esac
}

#startowe menu
menu(){
#usuwanie plikow przy starcie (na wypadek gdyby przechowywaly smieci z zle zamknietego programu)
if [ -f "$(pwd)/podsumowanie.txt" ] ; then
	rm podsumowanie.txt
fi

if [ -f "$(pwd)/dozaplaty.txt" ] ; then
	rm dozaplaty.txt
fi

#tworzenie katalogu przechowujacego rachunki i katalogu przechowujacego bilety (jesli nie istnieje)
if [ ! -d "$(pwd)/rachunki" ] ; then
	mkdir rachunki 
fi
if [ ! -d "$(pwd)/bilety" ] ; then
	mkdir bilety
fi


biletomat_wybor=0
while [ $biletomat_wybor -ne "1" -a $biletomat_wybor -ne "2" -a $biletomat_wybor -ne "3" ] ; do
	clear
	echo "		BILETOMAT"
	echo ""
	echo "1. Dodaj bilet"
	echo "2. KKM"
	echo "3. Wyjdz"
	read biletomat_wybor
done

case $biletomat_wybor in
	"1") BILETY ;;
	"2") KKM ;;
	"3") 
	echo "Koniec" ;;
esac
}

#menu poczatkowe do zakupu biletow
BILETY(){
bilety_wybor=0
touch $(pwd)/podsumowanie.txt
touch $(pwd)/dozaplaty.txt
while [ $bilety_wybor -ne "1" -a $bilety_wybor -ne "2" -a $bilety_wybor -ne "3" -a $bilety_wybor -ne "4" ] ; do
	clear
	echo "		BILETY"
	echo "->Jesli dodales juz wszystkie interesujace Cie bilety przejdz do platnosci"
	echo ""
	echo "1. MIASTO"
	echo "2. AGLOMERACJA"
	echo "3. Platnosc"
	echo "4. Wroc"
	read bilety_wybor
	case $bilety_wybor in
		"1") BILETY_ULGA $bilety_wybor ;;
		"2") BILETY_ULGA $bilety_wybor ;;
		"3")
		ZAPLAC ;;
		"4") 
			#Po wyjsciu do menu glownego bilety sa usuwane
			if [ -s $(pwd)/dozaplaty.txt ] ; then
			echo ""
			echo "->Usuwanie wprowadzonych biletow..."
			sleep 3
			fi 
			menu ;;
	esac
done
}

#po wybraniu strefy wyswietla sie kolejne menu umozliwiajace wybor ulgi, 
#funkcja jedna do wyswietlania biletow dla miasta i aglomeracji rozpoznawana przekazanego parametru
BILETY_ULGA(){
ulga=0
strefa=$1
while [ $ulga -ne "1" -a $ulga -ne "2" -a $ulga -ne "3" ] ; do
	clear
	if [ $strefa -eq "1" ] ; then
		echo "		BILETY MIASTO"
	else
		echo "		BILETY AGLOMERACJA"
	fi
	echo ""
	echo "1. Normalny"
	echo "2. Ulgowy"
	echo "3. Wroc"
	read ulga
	case $ulga in
		"1") BILET_ZAKUP $strefa $ulga ;;
		"2") BILET_ZAKUP $strefa $ulga ;;
		"3") BILETY ;;
	esac
done
}

#menu do wyboru strefy dla KKM
KKM(){
if [ -f "$(pwd)/podsumowanie.txt" ] ; then
        rm podsumowanie.txt
fi

KKM_wybor_strefa=0
while [ $KKM_wybor_strefa -ne "1" -a $KKM_wybor_strefa -ne "2" -a $KKM_wybor_strefa -ne "3" ] ; do
	clear
	echo "		KKM"
	echo ""
	echo "1. Miasto"
	echo "2. Aglomeracja"
	echo "3. Wroc"
	read KKM_wybor_strefa
	case $KKM_wybor_strefa in
		"1") KKM_ulga $KKM_wybor_strefa ;;
		"2") KKM_ulga $KKM_wybor_strefa ;;
		"3") menu ;;
	esac
done
}


#wybor ulgi, strefa rozpoznawana na podstawie przekazanego parametru
KKM_ulga(){
KKM_strefa=$1
clear
if [ $KKM_strefa -eq "1" ] ; then
	echo "		KMM MIASTO:"

fi

if [ $KKM_strefa -eq "2" ] ; then
	echo "		KMM AGLOMERACJA:"
fi

KKM_ulga_wybor=0

while [ $KKM_ulga_wybor -ne "1" -a $KKM_ulga_wybor -ne "2" -a $KKM_ulga_wybor -ne "3" ] ; do

	echo ""
	echo "1. Normalny"
	echo "2. Ulgowy"
	echo "3. Wroc"
	read KKM_ulga_wybor
	case $KKM_ulga_wybor in
		"1") KKM_ZAKUP $KKM_strefa $KKM_ulga_wybor ;;
		"2") KKM_ZAKUP $KKM_strefa $KKM_ulga_wybor ;;
		"3") KKM ;;
	esac
done
}

#zaleznie od wybranej strefy i ulgi przekazanych jako parametry, taka tablica jest uzywana
#nastepnie uzytkownik wybiera jaki bilet i na jaki okres
KKM_ZAKUP(){
strefa=$1
ulga=$2
osoba=""
miesiace=13
clear
if [ $strefa -eq 1 -a $ulga -eq 1 ] ; then
	echo "		KKM NORMALNY MIASTO"
	bilety=( "${normalny_miasto_KKM[@]}" )
	ceny=( "${normalny_miasto_KKM_price[@]}" )
fi


if [ $strefa -eq 2 -a $ulga -eq 1 ] ; then
        echo "          KKM NORMALNY AGLOMERACJA"
        bilety=( "${normalny_aglo_KKM[@]}" )
        ceny=( "${normalny_aglo_KKM_price[@]}" )
fi


if [ $strefa -eq 2 -a $ulga -eq 2 ] ; then
        echo "          KKM ULGOWY AGLOMERACJA"
        bilety=( "${ulgowy_aglo_KKM[@]}" )
        ceny=( "${ulgowy_aglo_KKM_price[@]}" )
fi


if [ $strefa -eq 1 -a $ulga -eq 2 ] ; then
        echo "          KKM ULGOWY MIASTO"
        bilety=( "${ulgowy_miasto_KKM[@]}" )
        ceny=( "${ulgowy_miasto_KKM_price[@]}" )
fi

echo ""

KKM_wybor=100
while [ $KKM_wybor -gt "$((${#bilety[*]}+1))" ] ; do
        for (( i=0;i<"${#bilety[*]}";i++ )); do
                echo $(($i+1)) "${bilety[$i]} | ${ceny[$i]}"
        done
        echo "$(($i+1)) Wroc"
        read KKM_wybor
done

if [ "$KKM_wybor" -eq "$(($i+1))" ] ; then
      	KKM
else
	if [ $KKM_wybor -eq "4" -a $ulga -eq 2 ] ; then
		echo ""
                echo "->Prosze podac imie oraz nazwisko wlasciciela biletu:"
                read osoba
		echo ""
        	echo "   Bilet         : ${bilety[$(($KKM_wybor-1))]}" >> $(pwd)/podsumowanie.txt
		echo "   Osoba         : $osoba" >> $(pwd)/podsumowanie.txt
		echo "->Przechodze do platnosci"
		sleep 3
		KKM_ZAPLAC "${bilety[$(($KKM_wybor-1))]}" "${ceny[$(($KKM_wybor-1))]}" "1"
	else	
		echo ""
		echo "->Prosze podac imie oraz nazwisko wlasciciela biletu:"
		read osoba
		while [ $miesiace -gt 12 -o $miesiace -lt 1 ] ; do
        		echo ""	
	        	echo "->Prosze podac dlugosc waznosci biletu (od 1 do 12 miesiecy, podac liczbe miesiecy):"
			read miesiace
			if [ $miesiace -gt 12 -o $miesiace -lt 1 ] ; then
				echo ""
				echo "<-Podano niedozwolona ilosc miesiecy!"
			fi
		done
		echo ""
		echo "->Prosze podac miesiac od ktorego bilet ma byc wazny (aktualny, badz kolejny, miesiac prosze podac liczbe (1-12)):"
		miesiac_start=13
		aktual_miesiac=$(date '+%m')
		echo "Dostepne miesiace: "
		echo "Aktualny miesiac: "$(wyswietl_miesiac $aktual_miesiac)" ("$aktual_miesiac")"
		next_miesiac=$(($(date '+%m')+1))

		if [ $next_miesiac -eq "13" ] ; then
			$next_miesiac=$("1")
		fi
		echo "Nastepny miesiac: "$(wyswietl_miesiac $next_miesiac)" ("$next_miesiac")"
		while (( "$miesiac_start != $aktual_miesiac && $miesiac_start != $next_miesiac" )) ; do
			read miesiac_start
			if (( "$miesiac_start != $aktual_miesiac && $miesiac_start != $next_miesiac" )) ; then
				echo "->Wybrano niepoprawny miesiac!"
			fi
		done

		if (( "$KKM_wybor <= 2 && $KKM_wybor >= 1" )) ; then
			if [ $strefa -eq "1" ] ; then
				linie=( "${linie_miasto[@]}" )
			else
				linie=( "${linie_aglo[@]}" )
			fi 
	
			if [ $KKM_wybor -eq "1" ] ; then
				znaleziono=0
				while [ $znaleziono -ne "1" ] ; do
					echo ""
					echo "->Podaj linie: "
					read wybor_linia_jeden
					for (( i=0;i<${#linie[*]};i++ )); do
						if [ $wybor_linia_jeden -eq "${linie[$i]}" ] ; then
							znaleziono=1
						fi
					done
					if [ $znaleziono -eq 0 ] ; then
						echo ""
						echo "->Nie ma takiej lini!"
					fi
				done
			else
				znaleziono=0
				while [ $znaleziono -ne "1" ] ; do
					echo ""
					echo "->Podaj pierwsza linie: "
					read wybor_linia_jeden
					for (( i=0;i<${#linie[*]};i++ )); do
						if [ $wybor_linia_jeden -eq "${linie[$i]}" ] ; then
							znaleziono=1
						fi
					done
	                                if [ $znaleziono -eq "0" ] ; then
	                                       	echo ""
						echo "->Nie ma takiej linii!"
	                                fi
				done
	
				znaleziono=0
				while [ $znaleziono -ne "1" ] ; do
					echo ""
        	                        echo "->Podaj druga linie: "
	                                read wybor_linia_dwa
	                                for (( i=0;i<${#linie[*]};i++ )); do
        	                                if [ $wybor_linia_dwa -eq "${linie[$i]}" ] ; then
	                                                znaleziono=1
	                                        fi
	                                done
	                                if [ $znaleziono -eq 0 ] ; then
	                                        echo ""
						echo "->Nie ma takiej linii!"
						sleep 3
	                                elif [ $wybor_linia_dwa -eq $wybor_linia_jeden ] ; then
						echo ""
						echo "->Wybrano ta sama linii!"
						sleep 3
						znaleziono=0
					fi
	                        done
			fi

			echo "   Bilet         : ${bilety[$(($KKM_wybor-1))]}" >> $(pwd)/podsumowanie.txt
			echo "   Waznosc       : od $(wyswietl_miesiac $miesiac_start); do: $(wyswietl_miesiac $(($miesiac_start+$miesiace-1)))" >> $(pwd)/podsumowanie.txt 
			echo "   Wybrane linie : $wybor_linia_jeden $wybor_linia_dwa" >> $(pwd)/podsumowanie.txt
			echo "   Osoba         : $osoba" >> $(pwd)/podsumowanie.txt
		
                        echo ""
                        echo "->Przechodze do platnosci"
			sleep 3
                        KKM_ZAPLAC "${bilety[$(($KKM_wybor-1))]}" "${ceny[$(($KKM_wybor-1))]}" $miesiace

		else
       			echo "   Bilet         : ${bilety[$(($KKM_wybor-1))]}" >> $(pwd)/podsumowanie.txt
			echo "   Waznosc od    : $(wyswietl_miesiac $miesiac_start) do: $(wyswietl_miesiac $(($miesiac_start+$miesiace-1)))" >> $(pwd)/podsumowanie.txt
			echo "   Osoba         : $osoba" >> $(pwd)/podsumowanie.txt
	        	echo ""
	        	echo "->Przechodze do platnosci"
	        	sleep 3
	        	KKM_ZAPLAC "${bilety[$(($KKM_wybor-1))]}" "${ceny[$(($KKM_wybor-1))]}" $miesiace
		fi
	fi
fi

}
 

#funkcja do obslugi zaplaty za bilet KKM, wylicza rabat w przypadku zakupu na dluzszy okres niz miesiac
#rabat wyliczony zgodnie z regulami zapisanymi na stronie z cennikiem
#pozostala czesc funkcji dziala identycznie jak funkcja zaplacBilet
KKM_ZAPLAC(){
bilet=$1
cena=$2
okres=$3
if [ $okres -ne "1" ] ; then
	cenaBezRabatu=$(echo "$cena*$okres" |bc -l )
	Rabat=$(printf "%.1f\n" $(echo "$cenaBezRabatu*(($okres-1)*0.01)" | bc -l ))
	cena=$(echo "$cenaBezRabatu-$Rabat" | bc -l )
fi

zaplacono=0
dozaplaty=$cena
cenadorachunku=$dozaplaty
wrzucono=0
while [ "$zaplacono" -ne 1 ] ; do
	clear
	echo "		PODSUMOWANIE BILETU: "
	echo ""		
	cat $(pwd)/podsumowanie.txt
	echo ""
	echo "Do zaplaty: $dozaplaty"
	echo "Wrzucono: $wrzucono"
	echo "1. Zaplac"
	echo "2. Wroc (zostana usuniete wprowadzone dane)"
	read wybor_kwoty
	case $wybor_kwoty in 
	"1")
		clear
		echo "->Ile wrzucasz?"
		echo "1. 10gr"
		echo "2. 20gr"
		echo "3. 50gr"
		echo "4. 1zl"
		echo "5. 2zl"
		echo "6. 5zl"
		echo "7. 10zl"
		echo "8. 20zl"
		echo "9. 50zl"
		echo "10. 100zl"
		echo "11. 200zl"
		echo "12. 500zl"
		read platnosc

		case $platnosc in
		"1") 
			dozaplaty=$(echo "$dozaplaty-0.10" | bc -l) 
			wrzucono=$(echo "$wrzucono+0.10" | bc -l)
			platnosc=0
		;;
		"2")
			dozaplaty=$(echo "$dozaplaty-0.20" | bc -l)
			wrzucono=$(echo "$wrzucono+0.20" | bc -l)
			platnosc=0
		;;
		"3")	dozaplaty=$(echo "$dozaplaty-0.50" | bc -l)
			wrzucono=$(echo "$wrzucono+0.50" | bc -l)
			platnosc=0
		;;
		"4")	dozaplaty=$(echo "$dozaplaty-1.00" | bc -l)
			wrzucono=$(echo "$wrzucono+1.00" | bc -l)
			platnosc=0
		;;
		"5")
			dozaplaty=$(echo "$dozaplaty-2.00" | bc -l)
			wrzucono=$(echo "$wrzucono+2.00" | bc -l)
			platnosc=0
		;;
		"6")
			dozaplaty=$(echo "$dozaplaty-5.00" | bc -l)
			wrzucono=$(echo "$wrzucono+5.00" | bc -l)
			platnosc=0
		;;
		"7")	
			dozaplaty=$(echo "$dozaplaty-10.00" | bc -l)
			wrzucono=$(echo "$wrzucono+10.00" | bc -l)
			platnosc=0
		;;
		"8")	
			dozaplaty=$(echo "$dozaplaty-20.00" | bc -l)
			wrzucono=$(echo "$wrzucono+20.00" | bc -l)
			platnosc=0
		;;
		"9")
			dozaplaty=$(echo "$dozaplaty-50.00" | bc -l)
			wrzucono=$(echo "$wrzucono+50.00" | bc -l)
			platnosc=0
		;;
		"10")
			dozaplaty=$(echo "$dozaplaty-100.00" | bc -l)
			wrzucono=$(echo "$wrzucono+100.00" | bc -l)
			platnosc=0
		;;
		"11")
			dozaplaty=$(echo "$dozaplaty-200.00" | bc -l)
			wrzucono=$(echo "$wrzucono+200.00" | bc -l)
			platnosc=0
		;;
		"12")
			dozaplaty=$(echo "$dozaplaty-500.00" | bc -l)
			wrzucono=$(echo "$wrzucono+500.00" | bc -l)
			platnosc=0
		;;
		"*")
			echo "Nieprawidlowa opcja!"
		;;
		esac
	

		if (( $(echo "$dozaplaty <= 0" | bc -l) )) ; then
			clear
			echo "->Zaplacono! Wydaje reszte: "$(echo "$dozaplaty*(-1)" | bc -l) 
			echo ""
			echo "->Drukowanie rachunku..."
			zaplacono=1
			nazwa=rachunek_$(date '+%Y-%m-%d_%H%M%S').txt
			touch $(pwd)/rachunki/$nazwa
			echo "======================================================" >> $(pwd)/rachunki/$nazwa
			echo "			Rachunek" >> $(pwd)/rachunki/$nazwa
			echo "	Zaplacono: 	"$cenadorachunku >> $(pwd)/rachunki/$nazwa
			echo "	Wydano reszte:  "$(echo "$dozaplaty*(-1)" |bc -l) >> $(pwd)/rachunki/$nazwa
			echo "	Data: 		"$(date '+%Y-%m-%d') $(date '+%H:%M:%S') >> $(pwd)/rachunki/$nazwa
			echo "======================================================" >> $(pwd)/rachunki/$nazwa
			sleep 2
			cat $(pwd)/rachunki/$nazwa
			echo ""
			echo "->Rachunek zapisano w "$(pwd)/rachunki/$nazwa
			echo ""
			echo "->Drukowanie biletu..."
			nazwa_bilet=bilet_$(date '+%Y-%m-%d_%H%M%S').txt
			touch $(pwd)/bilety/$nazwa_bilet
			echo "=======================================================" >> $(pwd)/bilety/$nazwa_bilet
			echo "                  BILET" >> $(pwd)/bilety/$nazwa_bilet
			echo "$(cat podsumowanie.txt)" >> $(pwd)/bilety/$nazwa_bilet
			echo "   Data zakupu   : "$(date '+%Y-%m-%d') $(date '+%H:%M:%S') >> $(pwd)/bilety/$nazwa_bilet
			echo "=======================================================" >> $(pwd)/bilety/$nazwa_bilet
			sleep 2
			cat $(pwd)/bilety/$nazwa_bilet
			echo ""
			echo "->Bilet zapisano w "$(pwd)/bilety/$nazwa_bilet
			echo ""
			sleep 15
			menu
		fi 
	;; 
	"2") 
		if (( $(echo "$wrzucono > 0" | bc -l) )) ; then
			clear
			echo ""
			echo "->Zwracam pieniadze..."
			echo "->Usuwam wprowadzone zmiany..."
			sleep 3
		fi
		echo "->Usuwam wprowadzone zmiany..."
		sleep 3
		zaplacono=1
		KKM
	;;
	esac
done
}

#na podstawie wyboru strefy i ulgi przekazanych jako parametry funkcja wyswietla dostepne do wyboru bilety
#oraz pyta o ilosc wybranego biletu
#plik podsumowanie.txt sluzy do wyswietlania jakie bilety wybral uzytkownik
#plik dozaplaty.txt sluzy do przechowywania cen za bilety ktore nastepnie sa sumowane
BILET_ZAKUP(){
strefa=$1
ulga=$2
clear
if [ $strefa -eq 1 -a $ulga -eq 1 ] ; then
	echo "		BILETY NORMALNE MIASTO"
	bilety=( "${normalny_miasto[@]}" )
	ceny=( "${normalny_miasto_price[@]}" )
fi

if [ $strefa -eq 2 -a $ulga -eq 1 ] ; then
	echo "		BILETY NORMALNE AGLOMERACJA"
	bilety=( "${normalny_aglo[@]}" )
	ceny=( "${normalny_aglo_price[@]}" )
fi

if [ $strefa -eq 1 -a $ulga -eq 2 ] ; then
	echo "		BILETY ULGOWE MIASTO"
	bilety=( "${ulgowy_miasto[@]}" )
	ceny=( "${ulgowy_miasto_price[@]}" )
fi

if [ $strefa -eq 2 -a $ulga -eq 2 ] ; then
	echo "		BILETY ULGOWE AGLOMERACJA"
	bilety=( "${ulgowy_aglo[@]}" )
	ceny=( "${ulgowy_aglo_price[@]}" )
fi

echo ""
BILET_wybor=100
while [ $BILET_wybor -gt "$((${#bilety[*]}+1))" ] ; do
	for (( i=0;i<"${#bilety[*]}";i++ )); do
		echo $(($i+1)) "${bilety[$i]} | ${ceny[$i]}"
	done
	echo "$(($i+1)) Wroc"
	read BILET_wybor
done


if [ "$BILET_wybor" -eq "$(($i+1))" ] ; then
	BILETY
else
	echo ""
	echo "->Prosze podac ilosc:"
	read ilosc
	echo ""
	echo "->Dodawanie biletow..."
	for (( i=0;i<ilosc;i++ )) do
		echo "${bilety[$(($BILET_wybor-1))]} | ${ceny[$(($BILET_wybor-1))]}" >> $(pwd)/podsumowanie.txt
		echo "${ceny[$(($BILET_wybor-1))]}" >> $(pwd)/dozaplaty.txt
	done

	sleep 3
	echo ""
	echo "->PODSUMOWANIE:"
	cat podsumowanie.txt
	sleep 3
	BILETY
fi 
}

#funckja wywolywana po wejsciu w opcje Platnosc, jezeli uzytkownik nie wybral biletu dostanie stosowny komunikat
#jezeli wybral bilety skrypt przechodzi do funkcji zakupBiletu przekazujac jej cene za wszystkie bilety
ZAPLAC(){
dozaplaty=0

if [ -f $(pwd)/dozaplaty.txt ] ; then
	while read num; do
		dozaplaty=$(echo "$dozaplaty+$num" | bc -l)
	done <dozaplaty.txt
fi

if [ $dozaplaty = 0 ] ; then
	clear
	echo ""
	echo "->Nie wybrano jeszcze zadnego biletu!"
	sleep 3
	BILETY
else
	zakupBiletu $dozaplaty
fi
}


#ta funkcja imituje wrzucanie pieniedzy do automatu, na koneic drukuje rachunek z aktulana data i godzina
#automat wydaje reszte ;)
#w momencie przerwania petli while automat zwraca wrzucone pieniadze i pozwala na dodanie nowych biletow
zakupBiletu()
{
zaplacono=0
dozaplaty=$1
cenadorachunku=$dozaplaty
wrzucono=0
while [ "$zaplacono" -ne 1 ] ; do
	clear
	echo "		PODSUMOWANIE BILETOW: "
	echo ""		
	cat $(pwd)/podsumowanie.txt
	echo ""
	echo "Do zaplaty: $dozaplaty"
	echo "Wrzucono: $wrzucono"
	echo "1. Zaplac"
	echo "2. Wroc"
	read wybor_kwoty
	case $wybor_kwoty in
	"1")
		clear
		echo "->Ile wrzucasz?"
		echo "1. 10gr"
		echo "2. 20gr"
		echo "3. 50gr"
		echo "4. 1zl"
		echo "5. 2zl"
		echo "6. 5zl"
		echo "7. 10zl"
		echo "8. 20zl"
		echo "9. 50zl"
		echo "10. 100zl"
		echo "11. 200zl"
		echo "12. 500zl"
		read platnosc
	
		case $platnosc in
		"1") 
			dozaplaty=$(echo "$dozaplaty-0.10" | bc -l) 
			wrzucono=$(echo "$wrzucono+0.10" | bc -l)
			platnosc=0
		;;
		"2")
			dozaplaty=$(echo "$dozaplaty-0.20" | bc -l)
			wrzucono=$(echo "$wrzucono+0.20" | bc -l)
			platnosc=0
		;;
		"3")	dozaplaty=$(echo "$dozaplaty-0.50" | bc -l)
			wrzucono=$(echo "$wrzucono+0.50" | bc -l)
			platnosc=0
		;;
		"4")	dozaplaty=$(echo "$dozaplaty-1.00" | bc -l)
			wrzucono=$(echo "$wrzucono+1.00" | bc -l)
			platnosc=0
		;;
		"5")
			dozaplaty=$(echo "$dozaplaty-2.00" | bc -l)
			wrzucono=$(echo "$wrzucono+2.00" | bc -l)
			platnosc=0
		;;
		"6")
			dozaplaty=$(echo "$dozaplaty-5.00" | bc -l)
			wrzucono=$(echo "$wrzucono+5.00" | bc -l)
			platnosc=0
		;;
		"7")	
			dozaplaty=$(echo "$dozaplaty-10.00" | bc -l)
			wrzucono=$(echo "$wrzucono+10.00" | bc -l)
			platnosc=0
		;;
		"8")	
			dozaplaty=$(echo "$dozaplaty-20.00" | bc -l)
			wrzucono=$(echo "$wrzucono+20.00" | bc -l)
			platnosc=0
		;;
		"9")
			dozaplaty=$(echo "$dozaplaty-50.00" | bc -l)
			wrzucono=$(echo "$wrzucono+50.00" | bc -l)
			platnosc=0
		;;
		"10")
			dozaplaty=$(echo "$dozaplaty-100.00" | bc -l)
			wrzucono=$(echo "$wrzucono+100.00" | bc -l)
			platnosc=0
		;;
		"11")
			dozaplaty=$(echo "$dozaplaty-200.00" | bc -l)
			wrzucono=$(echo "$wrzucono+200.00" | bc -l)
			platnosc=0
		;;
		"12")
			dozaplaty=$(echo "$dozaplaty-500.00" | bc -l)
			wrzucono=$(echo "$wrzucono+500.00" | bc -l)
			platnosc=0
		;;
		"*")
			echo "Nieprawidlowa opcja!"
		;;
		esac
 
		if (( $(echo "$dozaplaty <= 0" | bc -l) )) ; then
			clear
			echo "->Zaplacono! Wydaje reszte: "$(echo "$dozaplaty*(-1)" | bc -l) 
			echo ""
			echo "->Drukowanie rachunku..."
			zaplacono=1
			nazwa=rachunek_$(date '+%Y-%m-%d_%H%M%S').txt
			touch $(pwd)/rachunki/$nazwa
			echo "======================================================" >> $(pwd)/rachunki/$nazwa
			echo "			Rachunek" >> $(pwd)/rachunki/$nazwa
			echo "	Zaplacono: 	"$cenadorachunku >> $(pwd)/rachunki/$nazwa
			echo "	Wydano reszte:  "$(echo "$dozaplaty*(-1)" |bc -l) >> $(pwd)/rachunki/$nazwa
			echo "	Data: 		"$(date '+%Y-%m-%d') $(date '+%H:%M:%S') >> $(pwd)/rachunki/$nazwa
			echo "======================================================" >> $(pwd)/rachunki/$nazwa
			sleep 2
			cat $(pwd)/rachunki/$nazwa
			echo ""
			echo "->Rachunek zapisano w "$(pwd)/rachunki/$nazwa
			sleep 10
			menu
		fi 
	;; 
	"2") 
		if (( $(echo "$wrzucono > 0" | bc -l ) )) ; then
			echo ""
			echo "->Zwracam pieniadze..."
			sleep 3
		fi
		zaplacono=1
		BILETY
	;;
	esac
done
}

menu
