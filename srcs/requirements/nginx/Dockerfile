FROM debian:buster


RUN apt update && apt install -y nginx openssl
#y == yes fragt nach ob ich das moechte

#alle apkete gelichzeitig installieren
RUN mkdir etc/nginx/ssl


COPY ./config/default /etc/nginx/sites-available
#verstehe hier nicht genau was passiert


RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/rschleic.crt -keyout /etc/nginx/ssl/rschleic.key -subj "/CN=rschleic.42.fr/" 



EXPOSE 443



CMD ["nginx", "-g", "daemon off;"]
