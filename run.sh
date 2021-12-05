#!/bin/bash
platform=$(uname -s)

if [ "$platform" = "Darwin" ]; then
	a=$(find . -iname venv -depth 1)
else
	a=$(find . -maxdepth 1 -iname venv)
fi

echo "platform is $platform"

if [ "$a" = "./venv" ]; then
	echo found venv
else
	echo venv not found, creating...
	bash install_deps.sh
fi

source venv/bin/activate
python3 musicdb.py $@
