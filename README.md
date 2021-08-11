## Adafruit PCB Repo Cookiecutter
This is a Cookiecutter template for github repos for Adafruit PCB files.

You'll need:
 * Cookiecutter (`pip install cookiecutter`)
 * The Product page open
 * The github repo open in a browser
 * `git`

Run like so: `cookiecutter gh:adafruit/cookiecutter-adafruit-pcb`

You will be prompted for some info:
 * `pid [0]`: The Product id of the product (http://www.adafruit.com/product/PRODUCT_ID)
 * `product_name[]`: The name of the product, like LIS3DH, INA260, or QT Py RP2040
 * `directory_name [000_pcb]`: The directory that the cookie cutter will create, with the github repo checked out inside
 * `product_description []`: The type of sensor, like 'Current Sensor' or '3-axis Accelerometer', or the rest of the product name
 * `full_name [<sensor_name> <sensor_description>]`: The name of the product, without "Adafruit". Automatically generated from product name and description.
 * `repo_name [Adafruit-<sensor_name>-PCB]`: The name of the repository
 * `github_repo_url [https://www.github.com/adafruit/<repo_name>]`: Self explanitory; copy either the SSH or HTTPS url from the repo
 * `description [INSERT PRODUCT COPY HERE]`: If there is a small amount of copy for the description, you can paste it here. Does not handle multi-line input so most times I use the default and manually paste it in
 * `image_url [https://cdn-shop.adafruit.com/1200x900/<pid>-01.jpg]`: A full-res product photo showing the top of the board with pin labels, etc.
 * `eagle_file_directory []`: Typically left blank.
 * `designer [Limor Fried/Ladyada]` : The name of the person who designed the PCB

You'll be left with a new directory that has some files generated in it as well as a checkout of the given repo with the title `github_repo`. The post-generation hook will have already copied the assets directory with the image as well as the license.txt and the updated README.md into the github directory as well as `git add`ing them

Move into the repo directory, open the `README.md` and edit the description copy as needed. I tend to copy it from the product page, bolding and creating links as needed

When done editing, `git add README.md`, `git commit -m"updated repo to use adafruit pcb repo cookiecutter"`, `git push`

Reload the repo in the browser and you should see the new changes, make, commit, push edits as needed

Once you're done you may choose to keep the directory that cookiecutter created in case you later want to go back into the repo to make changes
### License

Adafruit invests time and resources providing this open source design, please support Adafruit and open-source hardware by purchasing products from [Adafruit](https://www.adafruit.com)!

Written by Bryan Siepert for Adafruit Industries.

Creative Commons Attribution/Share-Alike, all text above must be included in any redistribution. See license.txt for additional details.
