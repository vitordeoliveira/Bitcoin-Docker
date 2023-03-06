
FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

WORKDIR /bitcoin
# Install required packages
RUN apt-get update && \
    # Dev Dependencies
    apt-get install -y wget nano git-all curl && \
    # Build requirements:
    apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 libevent-dev libboost-dev && \
    # SQLite is required for the descriptor wallet:
    apt-get install -y libsqlite3-dev && \
    # Generate QRCode
    apt-get install -y libqrencode-dev
    
# GUI dependenciesGUI dependencies
# RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools qtwayland5
# Download and install Electrum
RUN git clone https://github.com/bitcoin/bitcoin.git .
RUN git fetch origin
RUN git checkout v24.0.1

RUN ./autogen.sh
RUN ./configure --without-gui
RUN make
RUN make install

RUN rm -rf /bitcoin
WORKDIR /usr/src/app

# Create data directory and configuration file
COPY bitcoin.conf bitcoin.conf

# Expose port 18332 and for BTC testnet protocol
EXPOSE 18332


# For Debug Network if needs
# RUN apt-get -y install net-tools tcpdump netcat
# RUN apt install -y apache2 
# RUN apt install -y apache2-utils 

# Start BTC in daemon mode
CMD ["bitcoind", "--datadir=."]
# CMD ["bitcoin-cli", "-datadir=.", "stop"]
