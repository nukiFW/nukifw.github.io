POST = post
PDF = pdf
RAW =  raw
SRC = src
RAWS = $(patsubst $(RAW)/%.md,%.html,$(wildcard $(RAW)/*.md))
PDFS = $(patsubst $(RAW)/%.md,%.pdf,$(wildcard $(RAW)/*.md))

.PHONY: clean

all: content
	@git add *
	@git commit -m "Update pages"
	@echo "Modifications commited"
	@git push origin master

content : post pdf

post: $(RAWS)
pdf: $(PDFS)

%.pdf: $(RAW)/%.md
	@pandoc -s --latex-engine=xelatex $< -o $(PDF)/$@
	@echo $(PDF)/$@ created

%.html: $(RAW)/%.md
	@$(eval TITLE :=  $(shell sed -n '0,/^\%/p' $< | sed -re 's/^\% *//'))
	@touch $(POST)/$@
	@sed -re "s/\{\{TITLE\}\}/$(TITLE)/" $(SRC)/header.html > $(POST)/$@
	@echo "<h1>"$(TITLE)"</h1>" >> $(POST)/$@
	@pandoc --webtex $< >> $(POST)/$@
	@cat $(SRC)/footer.html >> $(POST)/$@
	@echo $(POST)/$@ : [$(TITLE)] created

clean_html:
	rm -rf $(POST)/*.html
clean_pdf:
	rm -rf $(PDF)/*.pdf
clean: clean_html clean_pdf
