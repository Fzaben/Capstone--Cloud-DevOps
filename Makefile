lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	docker run --rm -i hadolint/hadolint < Dockerfile
