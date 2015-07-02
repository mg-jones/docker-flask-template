FROM ubuntu:latest
RUN apt-get -y update && apt-get install -y python2.7 python-flask python-dateutil python-tz python-pip apache2 libapache2-mod-wsgi
RUN /usr/bin/pip install Flask-SQLAlchemy
RUN /bin/ln -s /etc/webapp/webapp.conf /etc/apache2/sites-available/webapp.conf
RUN /bin/rm -f /etc/apache2/sites-available/000-default
RUN /usr/sbin/a2enmod wsgi.load
ADD conf/webapp.conf /etc/webapp/webapp.conf
# RUN sed -i 's/myserverhostname/'`hostname`'/g' /etc/webapp/webapp.conf
RUN /usr/sbin/a2ensite webapp.conf
ADD webapp/ /var/www/webapp/
RUN chown -R www-data.www-data /var/www/webapp
EXPOSE 80
CMD /usr/sbin/apache2ctl -D FOREGROUND
