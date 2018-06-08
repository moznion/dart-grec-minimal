.PHONY: fmt fmt-check lint test

test:
	pub run test

fmt:
	dartfmt --overwrite .

fmt-check:
	OUT=$$(dartfmt --dry-run .); \
	if [ ! -z $$OUT ]; then exit 1; fi

lint:
	dartanalyzer --options analysis_options.yaml .

