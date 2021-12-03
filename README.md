## Adafruit PCB Repo cookiecutter
This is a cookiecutter template for generating GitHub repos for Adafruit PCB files.

Requirements:
 * Cookiecutter (`pip install cookiecutter`)
 * The Product page open
 * The github repo open in a browser
 * Git - `git`

#### Running cookiecutter
Run as follows: `cookiecutter gh:adafruit/cookiecutter-adafruit-pcb`

When asked the following, continue with the default of `yes`:
```
You've downloaded /Users/kattni/.cookiecutters/cookiecutter-adafruit-pcb before. Is it okay to delete and re-download it? [yes]:
```

#### cookiecutter Prompts
You will be prompted for the following info:
 * `dev_board [n]`: Is this a microcontroller/dev board? Answer `y`/`yes` or `n`/`no`. Defaults to `n`.
 * `pid [0]`: The product id of the product, as found on adafruit.com, i.e. http://www.adafruit.com/product/PRODUCT_ID.
 * `product_name[]`: The basic name of the product, as in the sensor name like `LIS3DH`, or the dev board name like `QT Py RP2040`.
 * `directory_name [000_pcb]`: The local directory created by cookiecutter. Will contain the Git repo.
 * `product_name_description []`: The rest of the product name. For example, the type of sensor, like 'Current Sensor' or '3-axis Accelerometer'.
 * `full_name [<sensor_name> <sensor_description>]`: The name of the product, without "Adafruit". Automatically generated from product name and product description.
 * `repo_name [Adafruit-<sensor_name>-PCB]`: The name of the GitHub repository
 * `github_repo_url [https://www.github.com/adafruit/<repo_name>]`: Either the SSH or HTTPS url from the repo
 * `description [INSERT PRODUCT COPY HERE]`: If there is a small amount of copy for the description, you can paste it here. Does not handle multi-line input! In that case, leave blank, and manually edit resulting README.
 * `image_url [https://cdn-shop.adafruit.com/1200x900/<pid>-01.jpg]`: A full-res product photo showing the top of the board with pin labels, etc.
 * `board_file_name []`: The exact name of the board file in the boards repo, e.g. `ESP32-S2\ Rev\ C`. Can be left blank.
 * `board_file_directory []`: The exact path to the board file indicated by name above. Can be left blank.
 * `designer [Limor Fried/Ladyada]` : The name of the person who designed the PCB

The result is a new directory containing the generated files as well as a checkout of the given repo with the title `github_repo`.

#### Final steps
Open the repo directory, open the main `README.md` and edit the product copy as needed.

In the case of a microcontroller/dev board, obtain and include a factory reset .uf2 or .bin file in the
`factory-reset` directory.

When done editing, `git add .`, `git commit -m "Adding board files."`, `git push adafruit main`

Reload the repo in the browser, and you should see the new changes. Make, commit, push edits as needed.

Keeping the directory once it is completed is optional.

#### Post-Generation Hook Details
The post-generation hook does the following:
 * Copies the assets directory with the image
 * Removes the factory-reset directory if the board is not a microcontroller/dev board
 * Moves the license.txt and the generated README into the new directory
 * If provided properly, uses the board file name and directory to copy and properly rename the board files
 * `git add`s all of the existing files

### License

Adafruit invests time and resources providing this open source design, please support Adafruit and open-source hardware by purchasing products from [Adafruit](https://www.adafruit.com)!

Written by Bryan Siepert, Kattni Rembor for Adafruit Industries.

Creative Commons Attribution/Share-Alike, all text above must be included in any redistribution. See license.txt for additional details.
