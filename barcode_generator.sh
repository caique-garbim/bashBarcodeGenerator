#!/bin/bash

# Constantes para facilitar a utilização das cores.
GREEN='\033[32;1m'
BLUE='\033[34;1m'
RED='\033[31;1m'
RED_BLINK='\033[31;5;1m'
END='\033[m'

# Função chamada quando cancelar o programa com [Ctrl]+[c]
trap __Ctrl_c__ INT

__Ctrl_c__() {
   # __Clear__
    printf "\n${RED_BLINK} [!] Ação abortada!${END}\n\n"
    exit 1
}

if [ "$1" == "" ]
then
	echo " "
	toilet -f future " BASH BARCODE GENERATOR"
	echo " "
	echo -e "${BLUE}          |||||||  Gerador de codigo de barras${END}${RED} Code-128${END}${BLUE}  |||||||${END}"
	echo " "
	echo -e "${BLUE}   [*] Informe o texto desejado como argumento:${END}"
	echo -e "${BLUE}       Exemplo:${END}${GREEN} $0 \"Teste123\"${END}"
	echo " "
else
	echo " "
        toilet -f future " BASH BARCODE GENERATOR"
        echo " "
        echo -e "${BLUE}          |||||||  Gerador de codigo de barras${END}${RED} Code-128${END}${BLUE}  |||||||${END}"
        echo " "
        echo -e "${BLUE}   [*] Verificando conexao com a internet... ${END}"

	# VERIFICAR CONECTIVIDADE COM A INTERNET
	CONECTADO=$(ping -c1 8.8.8.8 | grep "1 received" | cut -d " " -f4)
	if [ "$CONECTADO" == "1" ]
	then
		echo " "
		echo -e "${GREEN}   [+] Conexao Ok${END}"
	else
		echo " "
		echo -e "${RED}   [!] Conexao nao existe${END}"
		exit
	fi

	echo " "
	echo -e "${BLUE}   [*] Gerando codigo de barras... ${END}"
	wget -q "https://barcode.tec-it.com/barcode.ashx?data=$1&code=Code128&translate-esc=on&download=true" -O barcode.png
	echo " "
	echo -e "${GREEN}   [+] Codigo de barras salvo em: $(pwd)/barcode.png"
fi
