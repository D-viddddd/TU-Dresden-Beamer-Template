.PHONY: demo demo-official demo-official-spread clean

demo:
	latexmk -xelatex -interaction=nonstopmode -file-line-error -synctex=1 example/demo.tex
	@echo "PDF: example/demo.pdf"

demo-official:
	latexmk -xelatex -interaction=nonstopmode -file-line-error -synctex=1 example/demo_official.tex
	@echo "PDF: example/demo_official.pdf"

demo-official-spread:
	latexmk -xelatex -interaction=nonstopmode -file-line-error -synctex=1 example/demo_official_spread.tex
	@echo "PDF: example/demo_official_spread.pdf"

clean:
	latexmk -C example/demo.tex
	latexmk -C example/demo_official.tex
	latexmk -C example/demo_official_spread.tex
