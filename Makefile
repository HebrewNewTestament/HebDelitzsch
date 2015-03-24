INST=inst

all: $(INST)/modules/texts/ztext/HebStrNeg2003/nt.bzs

$(INST)/modules/texts/ztext/HebStrNeg2003/nt.bzs: HebStrNeg2003.osis
	mkdir -p $(INST)/mods.d $(INST)/modules/texts/ztext/HebStrNeg2003
	osis2mod $(INST)/modules/texts/ztext/HebStrNeg2003 HebStrNeg2003.osis -z
	cp -a *.conf $(INST)/mods.d
	chmod -R g+rX,o+rX $(INST)

zip: all
	zip -r HebStrNeg2003-`date +%Y-%m-%d`.zip *.conf *.osis Makefile stuff TODO
	cd $(INST); zip -r ../HebStrNeg2003-`date +%Y-%m-%d`-installable.zip .

clean:
	rm -rf $(INST) *.zip
