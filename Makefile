export NOSE_INIT_MODULE=tests.nose_init
export PYTHONPATH=.
export TZ=UTC

install:
	pip install setuptools==20.0
	python setup.py install

install-dev: install
	pip install -r ./requirements/dev.txt

test:
	nosetests ./test -v

lint:
	flake8 outbrain --ignore=E123,E126,E128,E265,E501

clean:
	python setup.py clean
	find . -name '*.py[cox]' -delete
	rm -rf build/ dist/ *outbrain.egg-info

.PHONY:	test lint clean
