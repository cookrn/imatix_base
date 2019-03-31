FROM debian:stretch

RUN apt-get -y update
RUN apt-get -y install build-essential libtool libtool-bin python autoconf wget \
                       less vim

ENV IBASE="/usr/local"

WORKDIR /usr/src/base/vendor/openamq/tooling/base2/boom3
COPY vendor/openamq/tooling/base2/boom3 .
RUN make install

WORKDIR /usr/src/base/vendor/gsl/src
COPY vendor/gsl/src .
RUN make install

WORKDIR /usr/src/base/vendor/openamq/tooling/foreign
COPY vendor/openamq/tooling/foreign .

WORKDIR /usr/src/base/vendor/openamq/tooling/foreign/apr
RUN mv apr apr-1.3.3
RUN mv apr-util apr-util-1.3.4
RUN wget https://www-eu.apache.org/dist//apr/apr-1.6.5.tar.gz
RUN tar -xzf apr-1.6.5.tar.gz
RUN mv apr-1.6.5 apr
RUN wget https://github.com/libexpat/libexpat/releases/download/R_2_2_6/expat-2.2.6.tar.bz2
RUN tar -xjf expat-2.2.6.tar.bz2
RUN mv expat-2.2.6 expat
RUN wget https://www-eu.apache.org/dist//apr/apr-util-1.6.1.tar.gz
RUN tar -xzf apr-util-1.6.1.tar.gz
RUN mv apr-util-1.6.1 apr-util

WORKDIR /usr/src/base/vendor/openamq/tooling/foreign/apr/expat
RUN ./configure
RUN make
RUN make install

WORKDIR /usr/src/base/vendor/openamq/tooling/foreign
RUN boom all

WORKDIR /usr/src/base/vendor/openamq/tooling/base2
COPY vendor/openamq/tooling/base2 .
RUN boom all

WORKDIR /usr/src/base
ENTRYPOINT ["bin/base"]
CMD ["help"]
