FROM nginx:stable-alpine

RUN apk add --no-cache ca-certificates openssl curl bash

RUN curl -Lo /usr/local/bin/mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.3/mkcert-v1.4.3-linux-amd64 \
    && chmod +x /usr/local/bin/mkcert

RUN mkdir -p /etc/nginx/certs

RUN /usr/local/bin/mkcert -install && \
    /usr/local/bin/mkcert -cert-file /etc/nginx/certs/localhost.pem \
                          -key-file /etc/nginx/certs/localhost-key.pem \
                          localhost

COPY nginx.conf /etc/nginx/conf.d/default.conf