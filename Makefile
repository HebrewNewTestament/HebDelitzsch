INST=inst
TMP=tmp
SRC=$(shell pwd -P)
DATE=$(shell date +%Y-%m-%d)

all: $(INST)/modules/texts/ztext/HebDelitzsch/nt.bzs $(INST)/modules/texts/ztext/HebDelitzschNN/nt.bzs
	chmod -R g+rX,o+rX $(INST)

$(INST)/modules/texts/ztext/HebDelitzsch/nt.bzs: base.osis
	stuff/build "$(INST)" HebDelitzsch 'with Niqqud' base.osis "$(TMP)"

$(INST)/modules/texts/ztext/HebDelitzschNN/nt.bzs: $(TMP)/basenn.osis
	stuff/build "$(INST)" HebDelitzschNN 'with no Niqqud' "$(TMP)"/basenn.osis "$(TMP)"

$(TMP)/basenn.osis: base.osis
	mkdir -p "$(TMP)"
	stuff/remove-nikkud.py base.osis "$(TMP)"/basenn.osis

zip: all osis-and-conf-zip
	zip -r HebDelitzsch-src-$(DATE).zip *.conf *.osis Makefile stuff TODO
	for base in HebDelitzsch HebDelitzschNN; do \
			cd "$(INST)"; \
			zip -r \
				$(SRC)/$${base}-module-$(DATE).zip \
				mods.d/$${base}.conf \
				modules/texts/ztext/$${base}; \
			cd ..; \
	done

osis-and-conf-zip: all
	mkdir -p "$(TMP)/osis-and-conf"
	cp -p "$(INST)/mods.d/"*.conf "$(TMP)"/HebDelitzsch*.osis "$(TMP)/osis-and-conf"
	cd "$(TMP)/osis-and-conf"; zip -r $(SRC)/HebDelitzsch-osis-and-conf-$(shell date +%Y-%m-%d).zip .

clean:
	rm -rf $(INST) $(TMP) ./*.zip
