FROM ubuntu:18.04
MAINTAINER "Yuichi Takeuchi" <yuichi.takeuchi@takeyuweb.co.jp>

ENV NGINX_VERSION 1.15.6
ENV NGX_MRUBY_VERSION 2.1.3

RUN apt-get update -qq \
    && apt-get install -y build-essential ruby ruby-dev bison curl \
    && apt-get install -y libpcre3-dev libssl-dev zlib1g-dev \
    && apt-get install -y wget git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

RUN wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz \
    && tar zxvf nginx-${NGINX_VERSION}.tar.gz

RUN git clone https://github.com/matsumotory/ngx_mruby.git
WORKDIR /tmp/ngx_mruby
RUN git checkout v${NGX_MRUBY_VERSION} \
    && git submodule init \
    && git submodule update
COPY docker/build_config.rb /tmp/ngx_mruby/build_config.rb
RUN ./configure \
    --with-ngx-src-root=/usr/local/src/nginx-${NGINX_VERSION}
RUN make build_mruby
RUN make generate_gems_config

WORKDIR /tmp/nginx-${NGINX_VERSION}
RUN ./configure \
    --prefix=/usr/local/nginx \
    --with-http_ssl_module \
    --with-http_auth_request_module \
    --add-module=../ngx_mruby \
    --add-module=../ngx_mruby/dependence/ngx_devel_kit
RUN make && make install

WORKDIR /usr/local/nginx

EXPOSE 80

STOPSIGNAL SIGTERM

ENV PATH /usr/local/nginx/sbin:$PATH
CMD nginx
