INST=inst
TMP=tmp

all: $(INST)/modules/texts/ztext/HebDelitzsch/nt.bzs $(INST)/modules/texts/ztext/HebDelitzschNN/nt.bzs
	chmod -R g+rX,o+rX $(INST)

$(INST)/modules/texts/ztext/HebDelitzsch/nt.bzs: base.osis
	stuff/build "$(INST)" HebDelitzsch 'with Niqqud' base.osis "$(TMP)"

$(INST)/modules/texts/ztext/HebDelitzschNN/nt.bzs: $(TMP)/basenn.osis
	stuff/build "$(INST)" HebDelitzschNN 'with no Niqqud' "$(TMP)"/basenn.osis "$(TMP)"

$(TMP)/basenn.osis: base.osis
	mkdir -p "$(TMP)"
	stuff/remove-nikkud.py base.osis "$(TMP)"/basenn.osis

zip: all
	zip -r HebDelitzsch-src-`date +%Y-%m-%d`.zip *.conf *.osis Makefile stuff TODO
	cd $(INST); zip -r ../HebDelitzsch-modules-`date +%Y-%m-%d`.zip .

clean:
	rm -rf $(INST) $(TMP) *.zip
