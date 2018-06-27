#!/usr/bin/env sh
set -e

if [ "$(printf %c "$1")" = '-' ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpmd "$@"
elif [ "$1" = "/composer/vendor/bin/phpmd" ]; then
  set -- /sbin/tini -- php "$@"
elif [ "$1" = "phpmd" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/"$@"
elif [ -d "$1" ]; then
  set -- /sbin/tini -- php /composer/vendor/bin/phpmd "$@"
fi

exec "$@"
