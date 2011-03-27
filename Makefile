
VERSION=1.02

FILES=src/root/etc/default/grub \
      src/root/etc/grub.d/40_custom \
      src/root/etc/fstab \
      src/root/etc/rc.local \
      src/root/etc/apt/sources.list \
      src/root/etc/apt/preferences/pin-priority \
      src/root/etc/network/interfaces \
      src/root/etc/ssh/sshd_config \
      $(wildcard src/root/usr/local/bin/ec2-*)

BASENAME=debian_config_ec2
FILE_OUT=$(BASENAME)-$(VERSION)

.PHONY: all clean

all: $(FILE_OUT).tar.gz $(BASENAME)-latest.tar.gz

$(FILE_OUT).tar.gz: $(FILES)
	tar --verbose --create --file=$(FILE_OUT).tar src/root/
	gzip --best $(FILE_OUT).tar

$(BASENAME)-latest.tar.gz: $(FILE_OUT).tar.gz
	cp $(FILE_OUT).tar.gz $(@)

$(FILES):

clean:
	rm -f $(BASENAME)-*.tar.gz
