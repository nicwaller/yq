.PHONY: default
default: dist

test: $(wildcard **/*.py)
	find yq -name '*.py' -exec python -m py_compile {} \;

dist: test setup.py
	# sdist means "source distribution"
	python setup.py sdist
	# rm -r nicwaller.yq.egg-info

clean:
	rm -rf dist nicwaller.yq.egg-info

install: dist
	# python2 setup.py install # setuptools bad. no way to uninstall
	# could also do `pip install .` but using the egg seems more fancy
	pip install dist/nicwaller.yq*.tar.gz

uninstall:
	pip uninstall -y nicwaller.yq

devenv:
	virtualenv -p python2 devenv
	devenv/bin/pip install twine

upload: devenv dist
	devenv/bin/twine upload dist/*.tar.gz

