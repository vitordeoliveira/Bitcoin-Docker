FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

WORKDIR /bitcoin
# Install required packages
RUN apt-get update && \
    apt-get install -y wget nano git-all && \
    apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 && \
    apt-get install -y libevent-dev libboost-dev && \
    apt-get install -y libsqlite3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libqrencode-dev qtwayland5

# Download and install Electrum
RUN git clone https://github.com/bitcoin/bitcoin.git .
RUN git fetch origin
RUN git checkout v24.0.1

RUN ./autogen.sh
RUN ./configure 
RUN make
RUN make install

WORKDIR /usr/src/app

# Create data directory and configuration file
COPY bitcoin.conf bitcoin.conf

# Expose port 18333 for BTC testnet protocol
# EXPOSE 18333/tcp
# EXPOSE 18332/tcp

# Start BTC in daemon mode
CMD ["bitcoind", "-testnet"]
# CMD ["bitcoin-cli", "-datadir=.", "stop"]
