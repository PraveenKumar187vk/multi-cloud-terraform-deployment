#!/bin/bash
apt-get update
apt-get install -y nginx
echo "<html><body><h1>Hello from ${backend}!</h1></body></html>" > /var/www/html/index.html
systemctl restart nginx