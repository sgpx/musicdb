#!/bin/bash
virtualenv venv --python=python3
source venv/bin/activate
pip3 install boto3 bs4 requests
xpath=$(pwd)
cp -v ~/.bashrc ~/.bashrc.old
sed -r "s/.+MUSICDB_PATH.+//" -i ~/.bashrc
echo "export MUSICDB_PATH=$xpath" >> ~/.bashrc
ln -s $(realpath ./run.sh) ~/mdb
