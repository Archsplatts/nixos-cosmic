{ pkgs, ... }:

{
	environment.systemPackages = [
		pkgs.bat
		pkgs.btop
		pkgs.brave
		pkgs.calcurse
		pkgs.discord
		pkgs.dust
		pkgs.eza
		pkgs.fastfetch
		pkgs.file-roller
		pkgs.foot
		pkgs.git
		pkgs.gnome-disk-utility
		pkgs.galculator
		pkgs.lollypop
		pkgs.micro
		pkgs.mpv
		pkgs.nwg-look
		pkgs.poppler
		pkgs.qbittorrent
		pkgs.ristretto
		pkgs.rofi
		pkgs.termdown
		pkgs.thunderbird
		pkgs.trash-cli
		pkgs.unzip
		pkgs.webkitgtk_4_1
		pkgs.xz
		pkgs.yazi
		pkgs.zip
	];
}
