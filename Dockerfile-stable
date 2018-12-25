FROM debian:stretch

LABEL maintainer="Tobias Hargesheimer <docker@ison.ws>" \
	description="pandoc in Docker"

ENV LANG C.UTF-8
ENV TERM=xterm

RUN set -x \
	&& /bin/bash -c 'echo -e "deb http://ftp.uni-mainz.de/debian stretch main\ndeb http://ftp.uni-mainz.de/debian-security stretch/updates main\ndeb http://ftp.uni-mainz.de/debian stretch-updates main" > /etc/apt/sources.list' \
	&& apt-get update -qq \
	&& apt-get install -y -qq texlive texlive-latex-extra texlive-fonts-extra texlive-xetex make latexmk pandoc \
	#--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*
