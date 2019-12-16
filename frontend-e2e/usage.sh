#!/bin/sh

yarn install
yarn webdriver-manager update --versions.chrome 2.46
cp /tmp/chromedriver /protractor/node_modules/webdriver-manager/selenium/chromedriver_2.46
xvfb-run -a --server-args="-screen 0 1280x800x24 -ac -nolisten tcp -dpi 96 +extension RANDR" yarn start e2e.qa
