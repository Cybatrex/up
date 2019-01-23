#!/bin/bash

check_exit_status() {

	if [ $? -eq 0 ]
	then
		echo
		echo "SUCCESSFUL UPDATE"
		echo
	else
		echo
		echo "[ERROR] UPDATE PROCESS FAILED"
		echo
		
		read -p "UPDATE PROCESS FAILED, EXIT SCRIPT? (YES/NO) " answer

            if [ "$answer" == "yes" ]
            then
                exit 1
            fi
	fi
}

greeting() {

	echo
	echo "==SYSTEM UPDATE IN PROGRESS $USER=="
	echo
}

update() {

        sudo apt-get update;
	check_exit_status

        sudo apt-get upgrade -y;
	check_exit_status

        sudo apt-get dist-upgrade -y;
	check_exit_status
}

housekeeping() {

	sudo apt-get autoremove -y;
	check_exit_status

	sudo apt-get autoclean -y;
	check_exit_status

	sudo updatedb;
	check_exit_status
}

leave() {

	echo
	echo "--------------------"
	echo "- UPDATE COMPLETED! -"
	echo "--------------------"
	echo
	exit
}

greeting
update
housekeeping
leave
