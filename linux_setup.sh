#!/bin/sh


# THIS SCRIPT IS FREE FOR EVERYONE
# HOWEVER YOU NEED TO RESPECT THE AUTHOR OF THIS SCRIPT
# KEEP CREDITS AND MENTION THE USE OF THE SCRIPT
#
# Created by Kobunix <help@rootwork.eu>
#

# ================================================================
. includes/colors.sh
. includes/base_functions.sh
# ================================================================

SCRIPTNAME="Linux Server Setup"

MAX_STEPS=10

BASE_APPS="htop nload iptraf"

clear 

# ----------------------------------------------------------------------------------------------------
# @Tips
# ----------------------------------------------------------------------------------------------------
Tips () {
	echo "${Green}=${White}                                  ${RED}Availables Commands                                    ${Green}="
	echo "${Green}= ======================================================================================= ="
	echo "${Green}=                                                                                         ="
	echo "${Green}=   ${RED}update\t\t\t${White}Check for system update${Green}                                   ="
	echo "${Green}=   ${RED}install <base/advanced>\t${White}Install basic packages for your Linux Server${Green}              ="
	echo "${Green}=                                                                                         ="
	echo "${Green}===========================================================================================${NC}"
}

# ----------------------------------------------------------------------------------------------------
# @Setups
# ----------------------------------------------------------------------------------------------------
Setup_Basics (){

	echo "${RED}[ Step 1/${MAX_STEPS} ]\t ${WHITE}Checking for system updates ${NC}"
	apt-get update > /dev/null 2>&1
	
	echo "${RED}[ Step 2/${MAX_STEPS} ]\t ${WHITE}Applying system upgrade (if available)${NC}"
	apt-get upgrade -y > /dev/null 2>&1

	echo "${RED}[ Step 3/${MAX_STEPS} ]\t ${WHITE}Installing base APPS : ${Yellow}${BASE_APPS} ${NC}"
	apt-get install -y ${BASE_APPS} > /dev/null 2>&1

}

Setup_Update (){ 
	echo "${RED}[ UPDATE ]\t ${WHITE}Checking for system updates ${NC}" 
	apt-get update
	echo "${RED}[ UPDATE ]\t ${WHITE}Applying system upgrade (if available)${NC}"
	apt-get upgrade -y
}

if [ -z "$1" ]; then
	Header
	Tips
else
	Header
	
	# -------------------------------------
	# INSTALL
	# -------------------------------------
	if [ "$1" = "install" ]; then

		if [ -z "$2" ]; then
			Tips
		else
			if [ "$2" = "base" ]; then
				Setup_Basics

			elif [ "$2" = "advanced" ]; then
				echo $2
			
			else
				Tips
			fi
		fi

	# -------------------------------------
	# UPDATES
	# -------------------------------------
	elif [ "$1" = "update" ]; then
		Setup_Update
	
	# -------------------------------------
	# UPDATES
	# -------------------------------------

	# elif [ "$1" = "basic" ]; then
	# 	Setup_Basics2


	# -------------------------------------
	# RETURN TO NULL
	# -------------------------------------
	else
		# Header
		Tips
	fi

	
	# echo "${RED}[tor4] ${WHITE}Updating list ${NC}"
fi



