#!/bin/sh

poetry config virtualenvs.create false

exec "$@"
