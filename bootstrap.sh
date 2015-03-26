#!/bin/bash


apt-get update && apt-get upgrade -y

debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'
apt-get -y install mysql-server

apt-get install -y apache2 php5 php5-mysql php5-gd

a2enmod rewrite

rm /etc/apache2/sites-enabled/*
cp /vagrant/conf/vhost.conf /etc/apache2/sites-enabled/


service apache2 restart


cp /vagrant/docroot/sites/default/default.settings.php /vagrant/docroot/sites/default/settings.php
cp /vagrant/docroot/sites/default/default.services.yml /vagrant/docroot/sites/default/services.yml
chmod 777 /vagrant/docroot/sites/default/settings.php
chmod 777 /vagrant/docroot/sites/default/services.yml
mkdir /vagrant/docroot/sites/default/files
chmod 777 /vagrant/docroot/sites/default/files

