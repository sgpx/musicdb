#!/bin/bash
a=$(find . -iname venv -depth 1)
if [ "$a" = "./venv" ]; then
	echo found venv
else
	echo venv not found, creating...
	bash install_deps.sh
fi

source venv/bin/activate
python3 musicdb.py $@
