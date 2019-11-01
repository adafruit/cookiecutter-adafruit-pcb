#!/bin/bash
mkdir assets/
# make idempotent
pwd
python3 `which mkrepo` {{cookiecutter.repo_name}} --YES

# is this the same as cloning?
git init .
git remote add adafruit {{cookiecutter.github_repo_url}}
git fetch adafruit
git merge adafruit/master

# add stuff
wget {{cookiecutter.image_url}} -O assets/{{cookiecutter.pid}}.jpg
git rm readme.txt
git add README.md
git add license.txt
git add assets

# copy over files
sch_path=`find -s ~/boards/MBAdafruitBoards/ -type f -name '*{{cookiecutter.sensor_name}}*.sch'|tail -1`
brd_path="${sch_path/sch/brd}"

cp "$sch_path" ./Adafruit_{{cookiecutter.sensor_name}}.sch
cp "$brd_path" ./Adafruit_{{cookiecutter.sensor_name}}.brd
echo "Copied over"
echo $sch_path
echo and
echo $brd_path
echo "Make sure they're the correct version!"

git add *.sch *.brd
echo "DONE! Review, make changes, git add, push!"


exit 0
