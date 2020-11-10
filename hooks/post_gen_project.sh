#!/bin/bash
mkdir assets/
# make idempotent
pwd
python3 `which mkrepo` {{cookiecutter.repo_name}} --YES

# is this the same as cloning?
git init .
git checkout -b main
git remote add adafruit {{cookiecutter.github_repo_url}}
git fetch adafruit
git merge adafruit/main

# add stuff
wget {{cookiecutter.image_url}} -O assets/{{cookiecutter.pid}}.jpg
git rm readme.txt
git add README.md
git add license.txt
git add assets

# copy over files
echo 'cp {{cookiecutter.eagle_file_directory}}/*{{cookiecutter.sensor_name}}*.brd ./Adafruit_{{cookiecutter.sensor_name}}.brd'
echo 'cp {{cookiecutter.eagle_file_directory}}/*{{cookiecutter.sensor_name}}*.sch ./Adafruit_{{cookiecutter.sensor_name}}.sch'
cp {{cookiecutter.eagle_file_directory}}/*{{cookiecutter.sensor_name}}*.brd ./Adafruit_{{cookiecutter.sensor_name}}.brd
cp {{cookiecutter.eagle_file_directory}}/*{{cookiecutter.sensor_name}}*.sch ./Adafruit_{{cookiecutter.sensor_name}}.sch

echo "Copied over"
echo and
echo "Make sure they're the correct version!"

git add *.sch *.brd
echo "DONE! Review, make changes, git add, push!"


exit 0
