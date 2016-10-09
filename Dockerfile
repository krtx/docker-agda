FROM haskell:8.0.1
MAINTAINER KINOSHITA Minoru <kinoshita.minoru22@gmail.com>

ENV AGDA_VERSION 2.5.1.1
ENV AGDA_DIR /root/.agda

RUN apt-get update
RUN apt-get install -y curl

RUN stack install Agda-$AGDA_VERSION

RUN mkdir -p $AGDA_DIR/lib \
    && curl -SL https://github.com/agda/agda-stdlib/archive/v0.12.tar.gz \
    | tar -xzC $AGDA_DIR/lib \
    && echo 'standard-libraries' > $AGDA_DIR/defaults \
    && echo '${AGDA_DIR}/lib/agda-stdlib-0.12/standard-library.agda-lib' \
    > $AGDA_DIR/libraries-$AGDA_VERSION
