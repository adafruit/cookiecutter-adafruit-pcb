#!/bin/bash
mkdir assets/
wget {{cookiecutter.image_url}} -O assets/{{cookiecutter.pid}}.jpg
git clone {{cookiecutter.github_repo_url}} github_repo
cd github_repo
cp ../README.md .
git rm readme.txt
git add README.md
cp ../license.txt .
git add license.txt
cp -R ../assets .
git add assets
echo "DONE!"

exit 0
