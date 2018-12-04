FROM debian:stretch

LABEL maintainer="Tobias Hargesheimer <docker@ison.ws>" \
	description="pandoc in Docker"

ENV LANG C.UTF-8
ENV TERM=xterm

RUN set -x \
	&& /bin/bash -c 'echo -e "deb http://ftp.uni-mainz.de/debian stretch main\ndeb http://ftp.uni-mainz.de/debian-security stretch/updates main\ndeb http://ftp.uni-mainz.de/debian stretch-updates main" > /etc/apt/sources.list' \
	&& apt-get update -qq \
	&& apt-get install -y -qq texlive texlive-latex-extra texlive-xetex make latexmk wget curl \
	#--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& PANDOC_VERSION=$(curl -s https://api.github.com/repos/jgm/pandoc/tags  | grep 'name'  | cut -d\" -f4 | egrep -v [a-zA-Z] | head -n1) \
	&& wget -c -nv https://github.com/jgm/pandoc/releases/download/$PANDOC_VERSION/pandoc-$PANDOC_VERSION-1-amd64.deb \
	&& dpkg -i pandoc-$PANDOC_VERSION-1-amd64.deb \
	&& rm pandoc-$PANDOC_VERSION-1-amd64.deb
