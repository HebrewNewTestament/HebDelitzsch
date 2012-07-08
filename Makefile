INST=/home/didi/home/sword/inst

all: r/modules/texts/ztext/HebStrNeg2003/nt.bzs

r/modules/texts/ztext/HebStrNeg2003/nt.bzs: HebStrNeg2003.osis
	osis2mod r/modules/texts/ztext/HebStrNeg2003 HebStrNeg2003.osis -z

zip:
	zip -r ../HebStrNeg2003-`date +%Y-%m-%d`.zip .
	cd r; zip -r ../../HebStrNeg2003-`date +%Y-%m-%d`-installable.zip .

install:
	mkdir -p $(INST)/r/mods.d $(INST)/r/modules/texts/ztext/HebStrNeg2003
	cp -a Makefile HebStrNeg2003.osis $(INST)
	cp -a HebStrNeg2003.conf $(INST)/r/mods.d
	make -C $(INST)
