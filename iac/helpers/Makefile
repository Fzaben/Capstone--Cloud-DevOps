setup:
	# Create python virtualenv & source it

	py -m venv devops
	source devops/Scripts/activate

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	ls -la
