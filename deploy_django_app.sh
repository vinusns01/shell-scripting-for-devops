#!/bin/bash

<< task
Deploy a Django app
and handle the code for errors
task

code_clone() {
	echo " Cloning Django app"
	git clone https://github.com/vinusns01/django-notes-app.git
	cd django-notes-app
}

install_requirements() {
	echo "Installing dependencies"
	sudo apt-get install docker.io nginx -y
}

required_restarts() {
       	sudo chown $USER /var/run/docker.sock	
	sudo systemctl enable docker
	sudo systemctl enable nginx
	sudo systemctl restart docker
} 

deploy() { 
	docker build -t notes-app .
	docker run -d -p 8000:8000 notes-app:latest
}
 echo "************************** DEPLOYMENT STARTED *********************"
if ! code_clone ; then
	echo "The code directory already exixts"
fi

if ! install_requirements ; then
	echo " INSTALLATION FAILED"
	exit 1
fi

if ! required_restarts ; then
	echo "SYSTEM FAULT IDENTIFIED"
	exit 1
fi	

if ! deploy ; then 
	echo " DEPLOYMENT FAILED, mailing the admin"
	# sendmail
fi

echo "****************** DEPOYMENT DONE *******************"
