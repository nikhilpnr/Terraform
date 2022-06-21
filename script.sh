#!/bin/bash
  sudo yum update 
  sudo yum install -y httpd
  sudo systemctl start httpd
  chkconfig httpd on
  cd /var/www/html
  echo "<html><h1>Hello Team Welcome To My Webpage</h1></html>" > index.html
