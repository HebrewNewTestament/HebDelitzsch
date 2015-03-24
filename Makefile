INST=inst
TMP=tmp

all: $(INST)/modules/texts/ztext/HebStrNeg2003/nt.bzs $(INST)/modules/texts/ztext/HebStrNeg2003nn/nt.bzs
	chmod -R g+rX,o+rX $(INST)

$(INST)/modules/texts/ztext/HebStrNeg2003/nt.bzs: base.osis
	stuff/build "$(INST)" HebStrNeg2003 'with Niqqud' base.osis "$(TMP)"

$(INST)/modules/texts/ztext/HebStrNeg2003nn/nt.bzs: $(TMP)/basenn.osis
	stuff/build "$(INST)" HebStrNeg2003nn 'with no Niqqud' "$(TMP)"/basenn.osis "$(TMP)"

$(TMP)/basenn.osis: base.osis
	mkdir -p "$(TMP)"
	stuff/remove-nikkud.py base.osis "$(TMP)"/basenn.osis

zip: all
	zip -r HebStrNeg2003-src-`date +%Y-%m-%d`.zip *.conf *.osis Makefile stuff TODO
	cd $(INST); zip -r ../HebStrNeg2003-modules-`date +%Y-%m-%d`.zip .

clean:
	rm -rf $(INST) $(TMP) *.zip
