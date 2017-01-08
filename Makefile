.PHONY: default
default: dist

.PHONY: test
test: $(wildcard **/*.py)
	find yq -name '*.py' -exec python -m py_compile {} \;

dist: $(wildcard **/*.py) setup.py | test
	rm -rf dist
	# sdist means "source distribution"
	python setup.py sdist
	rm -r nicwaller.yq.egg-info

clean:
	rm -rf dist nicwaller.yq.egg-info devenv

install: dist
	# python2 setup.py install # setuptools bad. no way to uninstall
	# could also do `pip install .` but using the egg seems more fancy
	pip install dist/nicwaller.yq-$(shell cat yq/VERSION).tar.gz

uninstall:
	pip uninstall -y nicwaller.yq

devenv:
	virtualenv -p python2 devenv
	devenv/bin/pip install twine

upload: devenv dist
	# Make sure there are no uncommitted changes
	git diff-index --quiet HEAD --
	git tag "v$(shell cat yq/VERSION)"
	git push origin "v$(shell cat yq/VERSION)"
	devenv/bin/twine upload dist/nicwaller.yq-$(shell cat yq/VERSION).tar.gz
