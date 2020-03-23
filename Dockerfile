FROM devopsedu/webapp:latest
MAINTAINER Karthikeyan Ayyasamy

#Update Repository
RUN apt-get update -y

#Install Apache
RUN apt-get install -y apache2

#Install PHP Modules
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

#copy Application files
RUN rm -rf /var/www/html/*
ADD projCert /var/www/html

#Configure Apache
RUN chown -R www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

#Open port 80
EXPOSE 80

#Start Apache Service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
