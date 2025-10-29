.PHONY: demo clean

demo:
	latexmk -xelatex -interaction=nonstopmode -file-line-error -synctex=1 -output-directory=build example/demo.tex
	@echo "PDF: build/demo.pdf"

clean:
	latexmk -C -output-directory=build example/demo.tex
	rm -rf build
