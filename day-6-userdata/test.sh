sudo yum update -y
sudo yum install -y httpd
sudo service httpd start 
sudo systemctl enable httpd
echo "<h1> India is my country all indian are my brothers and my sister, i love my country</h1>" > /var/www/html/index.html