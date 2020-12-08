FROM alpine:latest
MAINTAINER khairilanuar

ENV NGINX_VERSION 1.19.5

RUN	apk update && \
	apk add \
		git \
		gcc \
		binutils \
		gmp \
		isl \
		libgomp \
		libatomic \
		libgcc \
		openssl \
		pkgconf \
		pkgconfig \
		ffmpeg \
		ffmpeg-libs \
		mpfr4\
		mpc1 \
		libstdc++ \
		ca-certificates \
		libssh2 \
		curl \
		expat \
		pcre \
		musl-dev \
		libc-dev \
		pcre-dev \
		zlib-dev \
		openssl-dev \
		make

RUN	cd /tmp/ && \
	wget http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
	git clone https://github.com/arut/nginx-rtmp-module.git

RUN	cd /tmp && \
	tar xzf nginx-${NGINX_VERSION}.tar.gz && \
	cd nginx-${NGINX_VERSION} && \
	./configure \
		--prefix=/opt/nginx \
		--with-http_ssl_module \
		--add-module=../nginx-rtmp-module && \
	make && \
	make install

RUN	cd /opt/ && \
	tar cvzf /tmp/nginx.tar.gz nginx

# Forward logs to Docker
RUN ln -sf /dev/stdout /opt/nginx/logs/access.log && \
    ln -sf /dev/stderr /opt/nginx/logs/error.log

RUN cp /tmp/nginx-rtmp-module/stat.xsl /opt/nginx/conf/stat.xsl
COPY nginx.conf-adaptive /opt/nginx/conf/

EXPOSE 1935
EXPOSE 80

CMD ["/opt/nginx/sbin/nginx", "-g", "daemon off;"]