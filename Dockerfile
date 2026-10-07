# Minimal Docker image for VSEARCH using Alpine base
FROM alpine:latest

# install VSEARCH
RUN apk update && \
    apk add --no-cache bash bzip2-dev g++ make wget zlib-dev && \
    wget -qO- "https://github.com/torognes/vsearch/releases/download/v2.32.0/vsearch-2.32.0.tar.gz" | tar -zx && \
    cd vsearch-* && \
    ./configure CFLAGS="-O3" CXXFLAGS="-O3" && \
    make ARFLAGS="cr" && \
    make install && \
    cd .. && \
    rm -rf vsearch-*
