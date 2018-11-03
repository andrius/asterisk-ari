#!/bin/sh

bundle update --retry 5 --jobs 4
exec "$@"
