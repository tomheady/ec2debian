
VERSION=1.0

FILES=src/root/boot/grub/menu.lst src/root/etc/fstab src/root/etc/rc.local src/root/etc/apt/sources.list src/root/etc/network/interfaces src/root/etc/ssh/sshd_config $(wildcard src/root/usr/local/bin/ec2-*)

FILE_OUT=debian_config_ec2-$(VERSION)

.PHONY: all clean

all: $(FILE_OUT).tar.gz

$(FILE_OUT).tar.gz: $(FILES)
	$(MAKE) -s clean
	tar --create --file=$(FILE_OUT).tar src/root/
	gzip --best $(FILE_OUT).tar

clean:
	rm -f $(FILE_OUT).tar.gz
