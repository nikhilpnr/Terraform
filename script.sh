#!/bin/bash
  sudo yum update 
  sudo yum install -y httpd
  sudo systemctl start httpd
  chkconfig httpd on
  cd /var/www/html
  echo "<html><h1>Hello BSH</h1></html>" > index.html
