FROM nginx
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html
WORKDIR /root
EXPOSE 88
