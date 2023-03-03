# Makefile for python template, used to manage most commands quickly

hello:
	@echo "Hello World"

# Run compile test, mypy, linter+mccabe and pytests
test: comptest mypy flake pytest

fm: isort blacken

# Run pytest
pytest:
	python -m pytest tests/

# Run pytest and generate coverage report
pytestc:
	python -m pytest --cov-report term-missing:skip-covered --cov=tests/

# Run pytests and generate html coverage report
pytestchtml:
	python -m pytest --cov-report html-missing --cov=tests/

# Formats all .py files
blacken:
	python -m black .

# Runs flake linter (Needs mccabe library to be installed)
flake:
	python -m flake8 --max-complexity 5

# Runs Isort on all python files
isort:
	python -m isort .

# Runs python compile and checks if there are any compilation errors
comptest:
	python -m compileall -q .\$(name)\
	python -m compileall -q .\tests\ 

# Runs Mypy on Code
mypy:
	python -m mypy .

# Remove all unused, temporary files
clean:

# Installs all Poetry Development dependencies
install-dev:
	poetry install --only dev

# installs all production dependencies
install:
	poetry install --only prod

# Create a subfolder with $name
create:
	mkdir $(name)