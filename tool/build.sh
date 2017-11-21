#!/bin/bash

[ -e src/popup.dart.js ] && rm src/popup.dart.js
[ -e src/popup.html ] && rm src/popup.html
[ -e src/styles.css ] && rm src/styles.css
[ -d src/img/ ] && rm -rf src/img/
[ -d src/packages/ ] && rm -rf src/packages/

pub get
pub build web

cp build/web/popup.dart.js src/
cp build/web/index.html src/popup.html
cp build/web/styles.css src/
cp -R build/web/img/ src/img/
cp -R build/web/packages/ src/packages/

rm -rf build/
