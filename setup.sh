#!/bin/sh


# THIS SCRIPT IS FREE FOR EVERYONE
# HOWEVER YOU NEED TO RESPECT THE AUTHOR OF THIS SCRIPT
# KEEP CREDITS AND MENTION THE USE OF THE SCRIPT
#
# Created by Kobunix <help@rootwork.eu>
#

# ================================================================
source "includes/colors.sh"
# ================================================================

MAX_STEPS=10

BASE_APPS="htop nload iptraf"

clear 
# ----------------------------------------------------------------------------------------------------
# @Header
# ----------------------------------------------------------------------------------------------------
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
	echo "${Green}=${White}                                   Server Setup Script                                   ${Green}="
	echo "${Green}=${White}                                      Version 1.0.0                                      ${Green}="
	echo "${Green}=${White}                             By Kobunix <kobunix@rootwork.eu>                            ${Green}="
	echo "${Green}===========================================================================================${NC}"
}

Setup_Basics (){

	echo "${RED}[ Step 1/${MAX_STEPS} ]\t ${WHITE}Checking for system updates ${NC}"
	apt-get update > /dev/null 2>&1
	
	echo "${RED}[ Step 2/${MAX_STEPS} ]\t ${WHITE}Applying system upgrade (if available)${NC}"
	apt-get upgrade -y > /dev/null 2>&1

	echo "${RED}[ Step 3/${MAX_STEPS} ]\t ${WHITE}Installing base APPS : ${Yellow}${BASE_APPS} ${NC}"
	# apt-get install -y ${BASE_APPS} > /dev/null 2>&1

}


if [ -z "$1" ]; then
	Header

else
	Header
	if [ "$1" = "basic" ]; then
		Setup_Basics
	fi

	
	# echo "${RED}[tor4] ${WHITE}Updating list ${NC}"
fi



