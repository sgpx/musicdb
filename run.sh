#!/bin/bash
a=$(find . -iname venv -depth 1)
if [ "$a" = "./venv" ]; then
	echo found venv
	source venv/bin/activate
	python3 musicdb.py $@
else
	echo not found
fi
