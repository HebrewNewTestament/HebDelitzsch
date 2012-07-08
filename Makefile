INST=/home/didi/home/sword/inst

all: r/modules/texts/ztext/HebDlz1885/nt.bzs

r/modules/texts/ztext/HebDlz1885/nt.bzs: HebDlz1885.osis
	osis2mod r/modules/texts/ztext/HebDlz1885 HebDlz1885.osis -z

zip:
	zip -r ../HebDlz1885-`date +%Y-%m-%d`.zip .
	cd r; zip -r ../../HebDlz1885-`date +%Y-%m-%d`-installable.zip .

install:
	mkdir -p $(INST)/r/mods.d $(INST)/r/modules/texts/ztext/HebDlz1885
	cp -a Makefile HebDlz1885.osis $(INST)
	cp -a HebDlz1885.conf $(INST)/r/mods.d
	make -C $(INST)
