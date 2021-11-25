#!/usr/bin/env python3
import easy_dynamodb.easy_dynamodb as edb

from bs4 import BeautifulSoup
import requests
import pprint
from sys import argv
import datetime

def get_timestamp():
    return datetime.datetime.now().isoformat()

def get_title(link):
    resp = requests.get(link).text
    soup = BeautifulSoup(resp, features="html.parser")
    title = soup.title.text
    return title


def submit_link(link):
    title = get_title(link)
    print(edb.dynamodb_client.put_item(
        TableName="music_db",
        Item={"link": {"S": link}, "title": {"S": title if title else ""}, "timestamp":{"S":get_timestamp()}},
    ))

def get_all_links():
    pprint.pprint(edb.get_all_items("music_db"))

if __name__ == "__main__":
    arg = argv[-1]
    if arg in ["-l","--list","list"]:
        get_all_links()
    else:
        submit_link(arg)
