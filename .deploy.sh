#!/bin/bash

set -e

echo; echo "updating composer dependencies"
/usr/local/bin/composer.phar install --prefer-dist --no-progress

echo; echo "compiling assets"
$(cd resources/assets && npm install && ./node_modules/gulp/bin/gulp.js)
