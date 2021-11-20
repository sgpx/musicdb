#!/bin/bash
echo $MUSICDB_PATH
cd $MUSICDB_PATH
source ./venv/bin/activate
python3 musicdb.py $@
