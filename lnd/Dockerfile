
FROM golang:latest

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

WORKDIR /lnd
# Install required packages
RUN apt-get update && \
    # Dev Dependencies
    apt-get install -y dpkg apt-utils && \
    apt-get install -y git

# Download and install LND
RUN git clone https://github.com/lightningnetwork/lnd .
# RUN git fetch origin
# RUN git checkout v24.0.1

RUN make install
# Create data directory and configuration file
COPY lnd.conf lnd.conf

# Add usefull alias
RUN echo 'alias lncli="lncli -n regtest --lnddir=."' >> ~/.bashrc

# For Debug Network if needs
# RUN apt-get -y install net-tools tcpdump netcat
# RUN apt install -y apache2 
# RUN apt install -y apache2-utils 

# Start BTC in daemon mode
# CMD ["tail","-f", "/dev/null"]
CMD ["lnd", "--lnddir=."]
