FROM nginx:latest

RUN echo "alias ll='ls -alF'" >> ~/.bashrc

RUN apt-get update \
    && apt-get install -y \
        curl \
        vim \
    && apt-get clean -y

# clean-up nginx default configs
RUN rm -rf /etc/nginx/conf.d/*

# copy php-fpm config
COPY php-fpm.conf /etc/nginx/conf.d/

WORKDIR /var/www/
