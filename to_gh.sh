#!/bin/bash

gitbook build .
cp -rf _book/* ~/GitHub/CentOS7
cd ~/GitHub/CentOS7_Pages
git add .
git commit -m 'pub'
git push origin gh-pages