#!/bin/sh

# ================================================================
# THIS SCRIPT IS FREE FOR EVERYONE
# HOWEVER YOU NEED TO RESPECT THE AUTHOR OF THIS SCRIPT
# KEEP CREDITS AND MENTION THE USE OF THE SCRIPT
#
# Created by Kobunix <help@rootwork.eu>
#
# $0 install
#
# ================================================================
. includes/colors.sh
. includes/base_functions.sh

NULLPTR="/dev/null 2>&1"

APACHE2_SITES_FOLDER="/etc/apache2/sites-available/"

# ================================================================
clear 
# ================================================================

# ----------------------------------------------------------------------------------------------------
# @Tips
# ----------------------------------------------------------------------------------------------------
Tips () {
	echo "${Green}=${White}                                  ${RED}Availables Commands                                    ${Green}="
	echo "${Green}= ======================================================================================= ="
	echo "${Green}=                                                                                         ="
	echo "${Green}=   ${RED}install \t${White}Install apache2 server${Green}                                                    ="
	echo "${Green}=   ${RED}uninstall \t${White}Uninstall apache2 server${Green}                                                    ="
	echo "${Green}=                                                                                         ="
	echo "${Green}===========================================================================================${NC}"
}


if [ -z "$1" ]; then
	Header
	Tips
else
	Header

	if [ "$1" = "install" ]; then
		
		ShowMessage "!" "Checking for system updates"
		apt-get update > ${NULLPTR}
		
		ShowMessage "!" "Installing apache2"
		apt-get install -y apache2 > ${NULLPTR}

		ShowMessage "!" "Installing PHP 8.0"
		apt-get install -y php > ${NULLPTR}
		apt-get install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 > ${NULLPTR}
		echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list > ${NULLPTR}
		wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add - > ${NULLPTR}
		apt-get update > ${NULLPTR}
		apt install -y php8.0 > ${NULLPTR}

		ShowMessage "!" "Enabling apache2 usefull modules"
		a2enmod ssl rewrite > ${NULLPTR}

		ShowMessage "!" "Server restarting..."
		service apache2 restart > ${NULLPTR}

	
	elif [ "$1" = "uninstall" ]; then
		ShowMessage "!" "Uninstall logic, this script doesn't delete '/var/www' files"
		apt purge -y apache2 > ${NULLPTR}
		apt purge -y php8.* > ${NULLPTR}


	elif [ "$1" = "secure" ]; then

		ShowMessage "!" "Disabling ServerSignature"
		sed -i 's/ServerSignature On/ServerSignature Off/gi' /etc/apache2/conf-enabled/security.conf > ${NULLPTR}
		
		ShowMessage "!" "Applying production Tokens (HTTP Header responses)"
		sed -i 's/ServerTokens OS/ServerTokens Prod/gi' /etc/apache2/conf-enabled/security.conf > ${NULLPTR}

		ShowMessage "!" "Creating Environments Folders [ '/var/www/unroot/', '/var/www/public/', '/var/www/private/' ]"
		mkdir /var/www/unroot > ${NULLPTR}
		mkdir /var/www/public > ${NULLPTR}
		mkdir /var/www/private > ${NULLPTR}
		rm -r /var/www/html > ${NULLPTR}


		ShowMessage "!" "Protecting all folders with basic index file"
		touch /var/www/unroot/index.html
		touch /var/www/public/index.html
		touch /var/www/private/index.html
		touch /var/www/index.html

		ShowMessage "!" "Applying environments rights"
		chown root:www-data -R /var/www/unroot > ${NULLPTR}
		chown root:www-data -R /var/www/public > ${NULLPTR}
		chown root:www-data -R /var/www/private > ${NULLPTR}

		ShowMessage "!" "Disabling base vhosts"
		a2dissite 000-default.conf > ${NULLPTR}
		a2dissite default-ssl.conf > ${NULLPTR}

		ShowMessage "!" "Deleting base vhosts"
		rm ${APACHE2_SITES_FOLDER}000-default.conf > ${NULLPTR}
		rm ${APACHE2_SITES_FOLDER}default-ssl.conf > ${NULLPTR}

		ShowMessage "!" "Create noroute Host"
		
		touch ${APACHE2_SITES_FOLDER}noroute.conf
		
		echo '<VirtualHost *:80>
	Redirect 500 /
	ErrorDocument 500 "<br><br><center><h3>Unauthorized Access</h3></center>"
	ServerName '$(dig +short myip.opendns.com @resolver1.opendns.com)'
	DocumentRoot /var/www/unroot
</VirtualHost>' > ${APACHE2_SITES_FOLDER}noroute.conf

		ShowMessage "!" "Enabling noroute Host"
		a2ensite noroute.conf > ${NULLPTR}


		ShowMessage "!" "Server restarting..."
		service apache2 restart > ${NULLPTR}



	# -------------------------------------
	# RETURN TO NULL
	# -------------------------------------
	else
		Tips
	fi
fi
