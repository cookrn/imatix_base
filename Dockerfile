FROM debian:stretch

RUN ["apt-get", "-y", "update"]
RUN ["apt-get", "-y", "install", "build-essential"]

ENV IBASE="/usr/src/ibase"
RUN mkdir -p ${IBASE}/bin
ENV PATH="${PATH}:${IBASE}/bin"

WORKDIR /usr/src/base
COPY . .

RUN make -C vendor/gsl/src
RUN cp vendor/gsl/src/c ${IBASE}/bin
RUN cp vendor/gsl/src/gsl ${IBASE}/bin

RUN make -C vendor/openamq/tooling/base2

ENTRYPOINT ["bin/base"]
CMD ["help"]
