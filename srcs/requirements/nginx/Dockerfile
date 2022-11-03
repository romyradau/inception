FROM debian:buster
RUN apt update && apt -y install nginx && apt install openssl
RUN mkdir etc/nginx/ssl
COPY ./config/default /etc/nginx/sites-available
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/rschleic.crt -keyout /etc/nginx/ssl/rschleic.key -subj "/CN=rschleic.42.fr/" 
EXPOSE 443
CMD ["nginx", "-g", "daemon_off;"]
