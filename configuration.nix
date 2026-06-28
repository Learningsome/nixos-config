# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
let
  unstable = import <nixos-unstable> {
    config = config.nixpkgs.config;
  };
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # Include home-manager
    ./home.nix

    # Include stylix
    # ./stylix.nix
  ];

  # Bootloader.
  boot = {
    initrd.luks.devices."luks-77cbdfe7-d621-4ed0-ab7e-f3b1c3ab632d".device =
      "/dev/disk/by-uuid/77cbdfe7-d621-4ed0-ab7e-f3b1c3ab632d";
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "nixos-btw"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "ru_RU.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    options = "grp:alt_shift_toggle";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."nikolaj" = {
    isNormalUser = true;
    description = "Nikolaj is using NixOS, btw";
    extraGroups = [
      "networkmanager"
      "wheel"
      "docker"
    ];
    shell = pkgs.zsh;
  };

  virtualisation.docker = {
    enable = true;
    autoPrune.enable = true;
  };

  # Allow zsh
  programs.zsh.enable = true;

  # Allow amnezia-vpn.
  programs.amnezia-vpn = {
    enable = true;
    package = unstable.amnezia-vpn;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System packages
    wget
    curl
    git
    btop
    fastfetch
    gnumake

    # Development
    kitty

    # Other stuff
    chromium
    discord
    telegram-desktop
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono # Или nerd-fonts.fira-code / nerd-fonts.hack
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Синхронизация времени
  services.timesyncd.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Nix оптимизации
  nix.settings = {
    auto-optimise-store = true; # Оптимизация хранилища
    # experimental-features = [ "nix-command" "flakes" ];  # Включить flakes
  };

  # Сборка мусора
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "26.05"; # Did you read the comment?

}
