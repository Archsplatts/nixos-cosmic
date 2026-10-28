{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./apps.nix
      ./theme.nix
    ];

  # ─── Boot ───────────────────────────────────────────────
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.configurationLimit = 5;

  # ─── Réseau ─────────────────────────────────────────────
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;
  
  # ─── Cosmic ─────────────────────────────────────────────
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;  

  services.xserver.xkb = {
    layout = "fr";
    variant = "azerty";
  };

  console.keyMap = "fr";

  environment.cosmic.excludePackages = with pkgs; [
    cosmic-player
    cosmic-term
  ];
  
  # ─── Localisation ───────────────────────────────────────
  time.timeZone = "Europe/Paris";
  i18n.defaultLocale = "fr_FR.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # ─── Utilisateur ──────────────────────────────────────── 
  users.users."bloods" = {
    isNormalUser = true;
    description = "bloods";
    extraGroups = [ "networkmanager" "wheel" ];
  };

 # ─── Programmes ─────────────────────────────────────────
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin 
    thunar-volman
  ];

  # ─── Services désactivés ────────────────────────────────
  systemd.services.ModemManager.enable = false;
  systemd.services.NetworkManager-wait-online.enable = false;
  
  # ─── Système ────────────────────────────────────────────
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05"; 

}
