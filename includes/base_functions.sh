#!/bin/sh

export SCRIPT_AUTHOR="Kobunix"
export GLOBSCRIPT_VERSION="0.0.3"



ShowMessage ()
{
	echo "${RED}[ ${WHITE}$1 ${RED}]\t ${WHITE}$2 ${NC}"
	sleep 1
}


Header () {
	echo "${Green}===========================================================================================${NC}"
	echo "${Green}=     ${WHITE}########   #######   #######  ######## ##      ##  #######  ########  ##    ##      ${Green}=${NC}"
	echo "${Green}=     ${WHITE}##     ## ##     ## ##     ##    ##    ##  ##  ## ##     ## ##     ## ##   ##       ${Green}=${NC}"
	echo "${Green}=     ${WHITE}##     ## ##     ## ##     ##    ##    ##  ##  ## ##     ## ##     ## ##  ##        ${Green}=${NC}"
	echo "${Green}=     ${WHITE}########  ##     ## ##     ##    ##    ##  ##  ## ##     ## ########  #####         ${Green}=${NC}"
	echo "${Green}=     ${WHITE}##   ##   ##     ## ##     ##    ##    ##  ##  ## ##     ## ##   ##   ##  ##        ${Green}=${NC}"
	echo "${Green}=     ${WHITE}##    ##  ##     ## ##     ##    ##    ##  ##  ## ##     ## ##    ##  ##   ##       ${Green}=${NC}"
	echo "${Green}=     ${WHITE}##     ##  #######   #######     ##     ###  ###   #######  ##     ## ##    ##      ${Green}=${NC}"
	echo "${Green}===========================================================================================${NC}"
	echo "${Green}=${White}                                      Version ${GLOBSCRIPT_VERSION}                                      ${Green}="
	echo "${Green}=${White}                             By Kobunix <kobunix@rootwork.eu>                            ${Green}="
	echo "${Green}===========================================================================================${NC}"
}
export Header