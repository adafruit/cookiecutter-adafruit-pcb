#!/bin/bash
mkdir assets/
# make idempotent
pwd
python3 `which mkrepo` {{cookiecutter.repo_name}} --YES

# Remove factory-reset if not needed
{% if cookiecutter.dev_board in ['n', 'no'] %}rm -rf factory-reset{% endif %}

# Setup repo
git init .
git checkout -b main
git remote add adafruit {{cookiecutter.github_repo_url}}
git fetch adafruit
git merge adafruit/main

# Add content
wget {{cookiecutter.image_url}} -O assets/{{cookiecutter.pid}}.jpg
git rm readme.txt

# copy over files
echo 'cp {{cookiecutter.board_file_directory}}/{{cookiecutter.board_file_name}}.brd ./Adafruit_{{cookiecutter.product_name}}.brd'
echo 'cp {{cookiecutter.board_file_directory}}/{{cookiecutter.board_file_name}}.sch ./Adafruit_{{cookiecutter.product_name}}.sch'
cp {{cookiecutter.board_file_directory}}/*{{cookiecutter.board_file_name}}*.brd ./Adafruit_{{cookiecutter.product_name}}.brd
cp {{cookiecutter.board_file_directory}}/*{{cookiecutter.board_file_name}}*.sch ./Adafruit_{{cookiecutter.product_name}}.sch

echo "Copied over"
echo and
echo "Make sure they're the correct version!"

git add .
echo "DONE! Review, make changes, git add, push!"


exit 0
