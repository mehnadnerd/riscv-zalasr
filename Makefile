# Makefile for RISC-V Doc Template
#
# This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
# International License. To view a copy of this license, visit
# http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to
# Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
#
# SPDX-License-Identifier: CC-BY-SA-4.0
#
# Description:
# 
# This Makefile is designed to automate the process of building and packaging 
# the Doc Template for RISC-V Extensions.

HEADER_SOURCE := header.adoc
PDF_RESULT := riscv-zalasr-0p1.pdf

ASCIIDOCTOR_PDF := asciidoctor-pdf
OPTIONS := --trace -a compress \
           -a mathematical-format=svg \
           -a pdf-fontsdir=docs-resources/fonts \
           -a pdf-style=docs-resources/themes/riscv-pdf.yml \
           --failure-level=ERROR
REQUIRES := --require=asciidoctor-bibtex \
            --require=asciidoctor-diagram \
            --require=asciidoctor-mathematical

.PHONY: all build clean

all: build

build:
	@echo "Building asciidoc"
	$(ASCIIDOCTOR_PDF) $(OPTIONS) $(REQUIRES) --out-file=$(PDF_RESULT) $(HEADER_SOURCE)

clean:
	@echo "Cleaning up generated files"
	rm -f $(PDF_RESULT)

