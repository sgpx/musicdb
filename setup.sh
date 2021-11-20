#!/bin/bash
virtualenv venv --python=python3
source venv/bin/activate
pip3 install boto3 bs4 requests
