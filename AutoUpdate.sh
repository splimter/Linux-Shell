#!/bin/bash

echo "### Adding files ###"
git add .
git add .gitignore

echo "### updating file ####"
git commit -m "auto-update"

echo "### uploading files ###"
git push origin master
