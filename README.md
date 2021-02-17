# pytest-loop
Run unit-test every time code is modified.

## How it works

Script is prepared to run on Django projects, where `manage.py` file manages tests with the following command:

`python manage.py test`

Steps are the following:

1. Run tests and log output.
1. Wait for one second
1. Check if some file is modified:
	* If this script file is modified, then stop and start script.
	* If some other file is modified, then go to step 1.
	* If no file is modified, then go to step 2.

## How to use

* Copy `pytest-loop.sh` to your Django workdir.
* Set permisions with `chmod 755 pytest-loop.sh`
* Open a terminal and activate virtual env if needed
* Run script on that terminal.
* It will start and endless loop. Stop it with Ctrl+C

Put the terminal to be always visible. Everytime you save a file within the workdir, tests will run and output will be shown.