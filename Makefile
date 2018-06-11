.PHONY: default fmt fmt-check lint test check

default: check

test:
	pub run test

fmt:
	dartfmt --overwrite .

fmt-check:
	dartfmt --set-exit-if-changed --dry-run .

lint:
	dartanalyzer --fatal-lints --options analysis_options.yaml .

check: test lint fmt-check

publish:
ifdef PROD
	pub publish
else
	pub publish --dry-run
endif

