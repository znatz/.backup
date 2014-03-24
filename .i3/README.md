Several references,
1. Setting up volumn, backlight, sloarized, shortcut to app.
   https://github.com/lkraav/dotfiles/blob/master/.i3/config
Solving lid closed,
1. http://fstyle.de/hp_fstyle/wordpress/2012/08/10/ubuntu-12-04-acpi/
2. https://lists.debian.org/debian-user/2012/02/msg00586.html
3. http://ubuntuforums.org/showthread.php?t=1076486
4. finally solution
	edit /etc/systemd/logind.conf
	you will see the line 
	#HandleLidSwitch=suspend
	change it to
	HandleLidSwitch=ignore
	then restart systemd-logind
	sudo restart systemd-logind
