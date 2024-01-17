#!/bin/sh

pip install -r requirements.txt -f https://download.pytorch.org/whl/cu118

exec "$@"
