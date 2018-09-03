#!/usr/bin/env bash
# Used on Ubuntu 16
# assuming that /bitcoin exists and contains:
# * bitcoin.conf
# * bitcoind.service
# * this script
mkdir /bitcoin/deps
mkdir /bitcoin/daemon
mkdir /bitcoin/data
cd /bitcoin/deps
wget https://www.bitcoinunlimited.info/downloads/BUcash-1.4.0.0-linux64.tar.gz
tar -xf BUcash-1.4.0.0-linux64.tar.gz
cp BUcash-1.4.0.0/bin/bitcoind /bitcoin/daemon/
chmod +x /bitcoin/daemon/bitcoind
cp BUcash-1.4.0.0/bin/bitcoin-cli /bitcoin/daemon/
chmod +x /bitcoin/daemon/bitcoin-cli
cd /bitcoin
mv bitcoin.conf /bitcoin/data/bitcoin.conf
mv bitcoind.service /bitcoin/daemon/bitcoind.service
cd /bitcoin/daemon/
cp ./bitcoind.service /lib/systemd/system/bitcoind.service
chmod 644 /lib/systemd/system/bitcoind.service
systemctl daemon-reload
systemctl enable bitcoind.service
systemctl start bitcoind.service
systemctl status bitcoind.service
