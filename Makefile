.ONESHELL:

DOC_DIR = src
BUILD_DIR = out

LATEX_SOURCES = $(wildcard $(DOC_DIR)/*_main.tex)
PDFS = $(patsubst $(DOC_DIR)/%.tex, $(BUILD_DIR)/%.pdf, $(LATEX_SOURCES))
PREVIEWS = $(patsubst $(BUILD_DIR)/%.pdf, $(BUILD_DIR)/%_preview.png, $(PDFS))

clean:
	rm -rf out

pdf: ${PDFS} ${PREVIEWS}

$(BUILD_DIR)/%.pdf: $(DOC_DIR)/%.tex | build_dirs
	rubber --pdf --into $(BUILD_DIR) $<

$(BUILD_DIR)/%_preview.png: $(BUILD_DIR)/%.pdf | build_dirs
	pdftoppm -png -f 1 -l 1 $< preview
	mv preview-01.png $@
	
build_dirs:
	mkdir -p $(BUILD_DIR)
	