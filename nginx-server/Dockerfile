#use the debian:buster image as parent image
FROM debian:buster
#-------------------------------------------------
#update all your package lists.
#update your index files to match the current contents of the repositories.
RUN apt-get update
#-------------------------------------------------
#to update all your installed softwares to the latest versions
#RUN apt-get upgrade
#-------------------------------------------------
#apt-get install
#chek the dependencies of the package you want and install any that are needed.
RUN apt-get install vim -y
#--------------------------------------------------
#install the last version of nginx for debian
#installing a Prebuilt Debian Package from the official NGINX Repository
#and not from the OS repository.
#--------------------------------------------------

#install the prequisites:
#curl command line tool and library for transferring data with URLs
#GnuPG is GNU's tool for secure communication and data storage.
#the lsb_release command displays LSB (Linux Standard Base) information about your specific Linux distribution, including version number, release codename, and distributor ID
#RUN apt-get install -y ca-certificates
RUN apt-get install curl -y
RUN apt-get install gnupg2 -y 
RUN apt-get install lsb-release  -y

#-----------------------------------------------------
#set up the apt repository for stable nginx packages

RUN echo "deb http://nginx.org/packages/debian `lsb_release -cs` nginx" |tee /etc/apt/sources.list.d/nginx.list

#------------------------------------------------------

#import an official nginx signing key so apt could verify the packages authenticity
RUN curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -

#------------------------------------------------------
#RUN command used to run the command inside your image filesystem
RUN apt-get update 
RUN apt-get install nginx -y

#-----------------------------------------------------------------
#install php
#install the PHP-FPM(FastCGI Process Manager)
RUN apt-get install -y php7.3-fpm

#-----------------------------------------------------------------
#COPY <src>...<dest>
#the COPY instruction copies new files or diretories from <src>and adds them to the filesystem of the container at the path <dest>
COPY default.conf /etc/nginx/conf.d/

#-----------------------------------------------------------------
#change the group of the user nginx
RUN usermod -G www-data nginx

#----------------------------------------------------------------
#Copy  mysql.sh into the Docker image
COPY mysql.sh /

#-----------------------------------------------------------------
#execute the mysql.sh script
RUN bash mysql.sh

#----------------------------------------------------------------
#install phpmyadmin from source

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz

#extract the content of the  archive
RUN tar -zxvf phpMyAdmin-5.0.2-all-languages.tar.gz

#change the name using mv command
RUN mv phpMyAdmin-5.0.2-all-languages/ phpmyadmin/

# change the location of phpmyadmin directory  using mv command
RUN mv phpmyadmin/ /usr/share/nginx/html/

#change the owner  and group of a directory recursively
RUN chown -R www-data:www-data /usr/share/nginx/html/phpmyadmin

#-----------------------------------------------------------------------------------
#install the mysqli extension
#mysqli extension is a relational database driver used to connect to the Mysql database server.
RUN apt-get install php-mysqli

#----------------------------------------------------------------------------------
#mbstring stands for multi-byte string functions. Mbstring is an extension of php used to manage non-ASCII strings.
RUN apt-get install php7.3-mbstring -y

#---------------------------------------------------------------------------------
RUN mv /usr/share/nginx/html/phpmyadmin/config.sample.inc.php  /usr/share/nginx/html/phpmyadmin/config.inc.php

#--------------------------------------------------------------------------------
COPY config.inc.php /

#-------------------------------------------------------------------------------
RUN mv config.inc.php  /usr/share/nginx/html/phpmyadmin/

#------------------------------------------------------------------------------
#copy phpmyadmin.sh into the docker image
COPY phpmyadmin.sh /

#-----------------------------------------------------------------------------
#chmod :change permisisons of a file (or folder in general) <==> change modes
# +x :add permission to execute the file to all (user, group and others)
RUN chmod +x phpmyadmin.sh

#---------------------------------------------------------------------------------
#download the latest WordPress installs.
#download the compressed release.
RUN wget https://wordpress.org/latest.tar.gz
#curl -LO https://wordpress.org/latest.tar.gz

#extract the compressed file to create the Wordpress directory structure.
RUN tar xf latest.tar.gz

RUN mv wordpress /usr/share/nginx/html/

#change the ownership of directory recursively to www-data
#the user and group that NGinx runs as, and Nginx will need to be able to read and write Wordpress files in order to serve the website.
RUN chown -R www-data:www-data /usr/share/nginx/html/wordpress

Run mv /usr/share/nginx/html/wordpress/wp-config-sample.php /usr/share/nginx/html/wordpress/wp-config.php

COPY wp-config.php /usr/share/nginx/html/wordpress/

COPY wordpress.sql /usr/share/nginx/html/wordpress/

#RUN rm -rf /usr/share/nginx/html/index.html

#RUN mv /usr/share/nginx/html/wordpress/*  /usr/share/nginx/html/

#RUN rm -rf /usr/share/nginx/html/wordpress

#execute a script file
RUN ./phpmyadmin.sh

#-------------------------------------------------------
CMD service mysql restart && service php7.3-fpm start && nginx -g 'daemon off;'

