FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

WORKDIR /bitcoin
# Install required packages
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y bsdmainutils && \
    apt-get install -y build-essential autoconf libssl-dev libboost-dev libboost-chrono-dev libboost-filesystem-dev \
    libboost-program-options-dev libboost-system-dev libboost-test-dev libboost-thread-dev libtool pkg-config libevent-dev nano git-all

# Download and install Electrum
RUN git clone https://github.com/bitcoin/bitcoin.git .

RUN ./autogen.sh
RUN ./configure --without-gui
RUN make
RUN make install

WORKDIR /usr/src/app

# Create data directory and configuration file
COPY bitcoin.conf bitcoin.conf

# Expose port 18333 for BTC testnet protocol
EXPOSE 18333/tcp

# Start BTC in daemon mode
CMD ["bitcoind", "-datadir=.", "-daemon"]
# CMD ["bitcoin-cli", "-datadir=.", "stop"]
