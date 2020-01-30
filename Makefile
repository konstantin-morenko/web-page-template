
SOURCE_NAME = test
SOURCE_FILE = $(SOURCE_NAME).org

HTML_FILE = index.html

EMACS_EXPORT = emacs --batch --exec "(progn (package-initialize) (package-install 'htmlize) (find-file \"$(1)\") ($(2)))"


all: $(HTML_FILE)


clean:
	@echo Clearing
	rm -r $(BUILD_DIR)


$(HTML_FILE): $(SOURCE_FILE)
	@echo Converting to html
	$(call EMACS_EXPORT,$(<),org-html-export-to-html)
	mv $(subst .org,.html,$(SOURCE_FILE)) index.html
