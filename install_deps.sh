#!/bin/bash
virtualenv venv --python=python3
source venv/bin/activate
pip3 install bs4 requests boto3
