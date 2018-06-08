.PHONY: fmt lint test

test:
	pub run test

fmt:
	dartfmt --overwrite .

lint:
	dartanalyzer --options analysis_options.yaml .
