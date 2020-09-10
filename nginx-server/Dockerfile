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
