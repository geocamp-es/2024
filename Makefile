.DEFAULT_GOAL := resumen.html

.PHONY: serve
serve:
	npx browser-sync start --server --files "assets/css/*.css"

.PHONY: clean
clean:
	rm -f resumen.html

resumen.html: clean
	pandoc -f gfm -t html \
	--metadata title="Resumen de la Geocamp 2023" \
	--template ./assets/documents/pandoc-template.html \
	https://pads.ccc.de/ep/pad/export/hvlMKryotI/latest?format=txt \
	> resumen.html
