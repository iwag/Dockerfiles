FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y nginx

ADD . /work
RUN cp /work/index.html /var/www/html/index.html

# RUN echo '<!doctype html><html><body><h1>www2</h1></body></html>' | tee /var/www/html/index.html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
