.PHONY: markdown
markdown:
	script/preprocess

.PHONY: html
html: markdown
	script/generate-html

.PHONY: preview
preview:
	script/preview

.PHONY: clean
clean:
	rm -rf dist/
