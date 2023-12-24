.PHONY: build install uninstall mo
PO_LOCATION ?= po
LOCALE_LOCATION ?= /share/locale
PREFIX ?= /usr

build:
	$(CRYSTAL_LOCATION)shards build --release

mo:
	mkdir -p $(PO_LOCATION)/mo
	for lang in `cat "$(PO_LOCATION)/LINGUAS"`; do \
		if [ "$$lang" = 'en' ] || [ -z "$$lang" ]; then continue; fi; \
		mkdir -p "$(PREFIX)$(LOCALE_LOCATION)/$$lang/LC_MESSAGES"; \
		msgfmt "$(PO_LOCATION)/$$lang.po" -o "$(PO_LOCATION)/mo/$$lang.mo"; \
		install -D -m 0644 "$(PO_LOCATION)/mo/$$lang.mo" "$(PREFIX)$(LOCALE_LOCATION)/$$lang/LC_MESSAGES/com.qiita.kojix2.hello-qiitan.mo"; \
	done

install: mo
	install -D -m 0755 bin/hello $(PREFIX)/bin/hello


uninstall:
	rm -f $(PREFIX)/bin/hello
	rm -rf $(PREFIX)$(LOCALE_LOCATION)/*/*/com.qiita.koji2.hello-qiitan.mo
