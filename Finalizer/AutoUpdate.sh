#!/bin/bash
git config --global credential.helper "cache --timeout=2592000"
echo "### Adding files ###"
git add .

echo "### updating file ####"
git commit -m "auto-update"

echo "### uploading files ###"
git push -u origin master
