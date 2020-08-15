Debian-Kernel-Cleaner / Purge-Old-Kernels-Debian

After installing a new Linux kernel, old kernels are not automatically deleted. They remain in your disk (/boot partition). You have to delete them manually

Some systems may become unusable if not enough disk space is available in /boot partition. And after a full-upgrade the system willl warn there is low disk space.

It is recommended to keep at least one or two older kernels, so you can boot your system in an emergency situation (hardware or software compatibility issues with the current kernel).

Using apt autoremove, will sometimes fx the issue, however sometimes you need to do it manually, which can be both dangerous and terrifying.

Manually you can:
                  uname -a
                  dpkg --list | grep linux-image 
                  dpkg --list | grep linux-headers
                  apt-get --purge remove linux-image-XXX
                  update-grub2
                  systemctl reboot
                  



Forked from https://github.com/dkhabarov/debian-kernel-cleaner and translated.
Documentation added from https://www.pontikis.net/blog/remove-old-kernels-debian-ubuntu
