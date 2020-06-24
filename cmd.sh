#!/usr/bin/env bash

set -e

if [ "$ENV" = 'DEV' ]; then
	echo "Running DEV server"
	exec python "identidock.py"
elif [ "$ENV" = 'UNIT' ]; then
	echo "Running UNIT tests"
	exec python "test.py"
else
	echo "Running PROD server"
	exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/identidock.py --callable app --stats 0.0.0.0:9191
fi
