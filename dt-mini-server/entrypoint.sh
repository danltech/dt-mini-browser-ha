#!/bin/sh
set -e

# /data wird als Bind-Mount root-owned eingehängt – hier korrigieren
chown -R mini:mini /data 2>/dev/null || true

# Privilegien auf "mini" zurückfallen lassen und Original-Prozess starten
if command -v su-exec >/dev/null 2>&1; then
    exec su-exec mini "$@"
elif command -v gosu >/dev/null 2>&1; then
    exec gosu mini "$@"
else
    exec setpriv --reuid=mini --regid=mini --clear-groups -- "$@"
fi
