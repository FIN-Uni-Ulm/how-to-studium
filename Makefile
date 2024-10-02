.ONESHELL:

DOC_DIR = src
BUILD_DIR = out

LATEX_SOURCES = $(wildcard $(DOC_DIR)/*_main.tex)
PDFS = $(patsubst $(DOC_DIR)/%.tex, $(BUILD_DIR)/%.pdf, $(LATEX_SOURCES))

clean:
	rm -rf out

pdf: ${PDFS}

$(BUILD_DIR)/%.pdf: $(DOC_DIR)/%.tex | build_dirs
	rubber --pdf --into $(BUILD_DIR) $<

build_dirs:
	mkdir -p $(BUILD_DIR)
	