#!/bin/bash

# Make assets folder
mkdir assets/

# Print the current working directory
pwd

# Create the GitHub repository
gh repo create adafruit/{{ cookiecutter.repo_name }} --public
if [ $? != 0 ]; then
    echo "Failed to create repo on GitHub."
    echo "Please check the following:"
    echo " * An Adafruit repository named {{ cookiecutter.repo_name }} does not already exist"
    echo " * You are authenticated for the gh CLI"
    echo " * You have permission to create repositories for Adafruit"
    exit 1
fi

# Remove factory-reset if not needed
{% if cookiecutter.dev_board in ['n', 'no'] %}rm -rf factory-reset{% endif %}

# Setup repo via git
git init .
git checkout -b main
git remote add adafruit {{cookiecutter.github_repo_url}}
git fetch adafruit

# Add content
wget {{cookiecutter.image_url}} -O assets/{{cookiecutter.pid}}.jpg
git rm readme.txt

# Copy over files
echo 'cp {{cookiecutter.board_file_directory}}/{{cookiecutter.board_file_name}}.brd ./Adafruit_{{cookiecutter.product_name}}.brd'
echo 'cp {{cookiecutter.board_file_directory}}/{{cookiecutter.board_file_name}}.sch ./Adafruit_{{cookiecutter.product_name}}.sch'
cp {{cookiecutter.board_file_directory}}/*{{cookiecutter.board_file_name}}*.brd ./Adafruit_{{cookiecutter.product_name}}.brd
cp {{cookiecutter.board_file_directory}}/*{{cookiecutter.board_file_name}}*.sch ./Adafruit_{{cookiecutter.product_name}}.sch
echo "Board and schematic files copied over."
echo "Make sure they're the correct version!"

# Stage additions
git add .
echo "DONE! Review, make changes, git add, push!"

exit 0
