FROM openjdk:16-jdk-alpine

RUN echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/main" > /etc/apk/repositories \
    && echo "http://dl-cdn.alpinelinux.org/alpine/v3.12/community" >> /etc/apk/repositories \
    && apk upgrade -U -a \
    && apk add \
    libstdc++ \
    chromium \
    chromium-chromedriver \
    harfbuzz \
    nss \
    freetype \
    ttf-freefont \
    make \
    gcc \
    g++ \
    python3 \
    git \
    nodejs \
    nodejs-npm \
    openssh \
    yarn \
    bash \
    && rm -rf /var/cache/* \
    && mkdir /var/cache/apk

COPY --from=zenika/alpine-chrome /etc/fonts/local.conf /etc/fonts/local.conf

ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

