setup:
	# Create python virtualenv & source it

	py -m venv devops
	source devops/Scripts/activate

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
	pip install -r requirements.txt

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile


all: install lint test