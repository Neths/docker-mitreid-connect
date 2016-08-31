#!/usr/bin/env bash

function update() {
    apt-get update && apt-get upgrade -yy
}

function install_base () {
    apt-get install -y \
        emacs \
        curl \
        git \
        htop \
        tmux \
        zip \
		bzip2 \
		tree \
		ncdu \
		ranger \
		pigz \
		pbzip2 \
		xz
}

function manage_locale () {
	dpkg-reconfigure locales && \
    locale-gen C.UTF-8 && \
    /usr/sbin/update-locale LANG=C.UTF-8
    
    ENV LC_ALL C.UTF-8
}

function install_docker () {
	curl -sL https://get.docker.io/ | sh
	curl -L https://github.com/docker/compose/releases/download/1.7.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
	chmod +x /usr/local/bin/docker-compose
	usermod -aG docker vagrant
}

function main () {
	export LC_ALL=C
	sudo locale-gen UTF-8
	export DEBIAN_FRONTEND=noninteractive

	adduser vagrant sudo

	update
	install_base
	manage_locale
	install_docker

	cd /home/vagrant
	cp /var/host/assets/vagrant/.bash_aliases /home/vagrant
	source /home/vagrant/.bashrc
}

main

