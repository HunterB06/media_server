#! /bin/sh
set -e

umask 002

chown -R ${BAZARR_UID}:${BAZARR_UID} /opt/bazarr/data
exec gosu bazarr python3 /opt/bazarr/bazarr.py
