#!/bin/sh
set -e

if [ "${1:0:1}" = "-" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpmd "$@"
elif [ "$1" = "/vendor/bin/phpmd" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpmd" ]; then
  set -- /sbin/tini -- php /vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /vendor/bin/phpmd "$@"
fi

exec "$@"
