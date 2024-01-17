#!/bin/sh

poetry config virtualenvs.in-project true 
poetry config cache-dir .cache
poetry install

# Start bash
exec "/bin/bash"

