0.1.2
=====

Fix a bug in the console script entry point.

0.1.1
=====

Fix a bug that prevents installation of module.

This stemmed from trying to use VERSION to define the version outside of setup.py. Well, that failed on install because setuptools was not including VERSION as part of the egg. And in order to get setuptools to include the file, I needed to convert the script into a Python module. Nice.

0.1.0
=====

first release
