
FILES=src/root/boot/grub/menu.lst src/root/etc/fstab src/root/etc/rc.local src/root/etc/apt/sources.list src/root/etc/network/interfaces src/root/etc/ssh/sshd_config $(wildcard src/root/usr/local/bin/ec2-*)

.PHONY: all clean

all: root.tar.gz

root.tar.gz: $(FILES)
	$(MAKE) -s clean
	tar --create --file=root.tar src/root/
	gzip --best root.tar

clean:
	rm root.tar.gz
